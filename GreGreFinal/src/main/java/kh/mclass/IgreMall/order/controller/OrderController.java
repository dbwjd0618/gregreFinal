package kh.mclass.IgreMall.order.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.emory.mathcs.backport.java.util.Arrays;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.order.model.service.OrderService;
import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.order.model.vo.OrderProduct;
import kh.mclass.IgreMall.order.model.vo.PayAccountInfo;
import kh.mclass.IgreMall.order.model.vo.PaymentInfo;
import kh.mclass.IgreMall.product.model.service.ProductService;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.shopMember.model.service.ShopMemberService;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/order")
public class OrderController {

	@Autowired
	OrderService orderService;
	@Autowired
	ProductService productService;
	@Autowired
	ShopMemberService shopMemberService;

	// 네이버페이일 경우만
	@GetMapping("/finishPayment.do")
	public ModelAndView getFinish(ModelAndView mav, OrderList orderList, HttpSession session,
			@RequestParam(value = "totalPrice", required = false) String totalPrice,
			@RequestParam(value = "prodPrice", required = false) String prodPrice,
			@RequestParam(value = "totalDiscount", required = false) String totalDiscount,
			@RequestParam(value = "usedPoint", required = false) String usedPoint,
			@RequestParam(value = "usedCoupon", required = false) String usedCoupon,
			@RequestParam(value = "couponId", required = false) String couponId,
			RedirectAttributes redirectAttributes) {

		Member m = (Member) session.getAttribute("memberLoggedIn");
		List<OrderProduct> orderProdList = (ArrayList<OrderProduct>) session.getAttribute("orderProdList");
		orderList.setMemberId(m.getMemberId());
		String sellerId = productService.selectSellerId(orderProdList.get(0).getProductId());
		String recptPhone = orderList.getRecptPhone();
		orderList.setRecptPhone(recptPhone.replaceAll("-", ""));
		orderList.setSellerId(sellerId);

		orderList.setDeliveryNo("deliTest1");
		orderList.setPayState("Y");
		orderList.setDeliveryState("B");

		PaymentInfo paymentInfo = new PaymentInfo();
		paymentInfo.setProdPrice(Integer.parseInt(prodPrice));
		paymentInfo.setTotalDiscount(Integer.parseInt(totalDiscount));
		paymentInfo.setUsedPoint(Integer.parseInt(usedPoint));
		paymentInfo.setUsedCoupon(Integer.parseInt(usedCoupon));

		ShopMember sMem = shopMemberService.selectOne(m.getMemberId());
		// 쿠폰사용
		if (paymentInfo.getUsedCoupon() > 0) {
			Coupon coupon = new Coupon();
			for (int i = 0; i < sMem.getCouponList().size(); i++) {
				if (sMem.getCouponList().get(i).getCouponId().equals(couponId)) {
					sMem.getCouponList().get(i).setCouponState("N");
					coupon.setMemberId(m.getMemberId());
					coupon.setCouponId(couponId);
					coupon.setCouponState("N");
				}
			}
			int couponResult = shopMemberService.updateCoupon(coupon);
			redirectAttributes.addFlashAttribute("msg", couponResult > 0 ? "쿠폰 사용 성공!" : "쿠폰 사용 실패");
		}
		// 포인트사용
		if (paymentInfo.getUsedPoint() > 0 && paymentInfo.getUsedPoint() <= sMem.getPoint()) {
			int afterPoint = sMem.getPoint() - paymentInfo.getUsedPoint();
			sMem.setPoint(afterPoint);
			int pointResult = shopMemberService.updateConsumerInfo(sMem);
			redirectAttributes.addFlashAttribute("msg", pointResult > 0 ? "포인트 사용 성공!" : "포인트 사용 실패");
		}

		// 주문하기
		int result = orderService.insertOrder(orderList, orderProdList, paymentInfo);
		redirectAttributes.addFlashAttribute("msg", result > 0 ? "주문성공!" : "주문실패");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		Date time = new Date();
		String orderDate = dateFormat.format(time);

		String method = orderList.getPayMethod();
		String payMethod = "";
		switch (method) {
		case "cr":
			payMethod = "신용카드 결제";
			break;
		case "ac":
			payMethod = "무통장입금";
			break;
		case "ph":
			payMethod = "휴대폰 결제";
			break;
		case "ka":
			payMethod = "카카오페이 결제";
			break;
		case "to":
			payMethod = "토스 결제";
			break;
		case "na":
			payMethod = "네이버페이 결제";
			break;
		case "ra":
			payMethod = "실시간계좌이체";
			break;
		}

		mav.addObject("orderNo", orderList.getOrderNo());
		mav.addObject("orderDate", orderDate);
		mav.addObject("payPrice", totalPrice);
		mav.addObject("payMethod", payMethod);
		mav.setViewName("shop/checkOut/finishPayment");
		return mav;
	}

	/**
	 * 0408 이진희
	 * 
	 * 주문하기완료
	 */
	@PostMapping("/finishPayment.do")
	public ModelAndView finishPayment(ModelAndView mav, OrderList orderList, HttpSession session,
			@RequestParam(value = "bankName", required = false) String bankName,
			@RequestParam(value = "accountHolder", required = false) String accountHolder,
			@RequestParam(value = "account", required = false) String account,
			@RequestParam(value = "expireDate", required = false) String expireDate,
			@RequestParam(value = "totalPrice", required = false) String totalPrice,
			@RequestParam(value = "prodPrice", required = false) String prodPrice,
			@RequestParam(value = "totalDiscount", required = false) String totalDiscount,
			@RequestParam(value = "usedPoint", required = false) String usedPoint,
			@RequestParam(value = "usedCoupon", required = false) String usedCoupon,
			@RequestParam(value = "couponId", required = false) String couponId,
			@RequestParam(value = "addPoint", required = false) String addPoint,
			RedirectAttributes redirectAttributes) {

		Member m = (Member) session.getAttribute("memberLoggedIn");
		List<OrderProduct> orderProdList = (ArrayList<OrderProduct>) session.getAttribute("orderProdList");
		orderList.setMemberId(m.getMemberId());
		String sellerId = productService.selectSellerId(orderProdList.get(0).getProductId());
		String recptPhone = orderList.getRecptPhone();
		orderList.setRecptPhone(recptPhone.replaceAll("-", ""));
		orderList.setSellerId(sellerId);

		orderList.setDeliveryNo("deliTest1");
		orderList.setPayState("Y");
		orderList.setDeliveryState("B");

		PaymentInfo paymentInfo = new PaymentInfo();
		paymentInfo.setProdPrice(Integer.parseInt(prodPrice));
		paymentInfo.setTotalDiscount(Integer.parseInt(totalDiscount));
		paymentInfo.setUsedPoint(Integer.parseInt(usedPoint));
		paymentInfo.setUsedCoupon(Integer.parseInt(usedCoupon));

		ShopMember sMem = shopMemberService.selectOne(m.getMemberId());
		// 쿠폰사용
		if (paymentInfo.getUsedCoupon() > 0) {
			Coupon coupon = new Coupon();
			for (int i = 0; i < sMem.getCouponList().size(); i++) {
				if (sMem.getCouponList().get(i).getCouponId().equals(couponId)) {
					sMem.getCouponList().get(i).setCouponState("N");
					coupon.setMemberId(m.getMemberId());
					coupon.setCouponId(couponId);
					coupon.setCouponState("N");
				}
			}
			int couponResult = shopMemberService.updateCoupon(coupon);
			redirectAttributes.addFlashAttribute("msg", couponResult > 0 ? "쿠폰 사용 성공!" : "쿠폰 사용 실패");
		}
		// 포인트사용 및 포인트 적립
		if (paymentInfo.getUsedPoint() > 0 && paymentInfo.getUsedPoint() <= sMem.getPoint()) {
			int afterPoint = sMem.getPoint() - paymentInfo.getUsedPoint() + Integer.parseInt(addPoint);
			sMem.setPoint(afterPoint);
			int pointResult = shopMemberService.updateConsumerInfo(sMem);
			redirectAttributes.addFlashAttribute("msg", pointResult > 0 ? "포인트 사용 성공!" : "포인트 사용 실패");
		}

		// 주문하기
		int result = orderService.insertOrder(orderList, orderProdList, paymentInfo);
		redirectAttributes.addFlashAttribute("msg", result > 0 ? "주문성공!" : "주문실패");

		// 가상계좌입금일 경우
		if (!bankName.equals("")) {
			orderList.setPayState("N");
			orderList.setDeliveryState("A");
			PayAccountInfo payAccInfo = new PayAccountInfo();
			payAccInfo.setAccountHolder(accountHolder);
			payAccInfo.setBankName(bankName);
			payAccInfo.setAccount(account);
			payAccInfo.setOrderNo(orderList.getOrderNo());

			try {
				String strDate = expireDate;
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date exDate = transFormat.parse(strDate);
				java.sql.Date sqlExDate = new java.sql.Date(exDate.getTime());
				payAccInfo.setExpireDate(sqlExDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int payAccResult = orderService.insertPayAccInfo(payAccInfo);
		}

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		Date time = new Date();
		String orderDate = dateFormat.format(time);

		String method = orderList.getPayMethod();
		String payMethod = "";
		switch (method) {
		case "cr":
			payMethod = "신용카드 결제";
			break;
		case "ac":
			payMethod = "가상계좌 입금";
			break;
		case "ph":
			payMethod = "휴대폰 결제";
			break;
		case "ka":
			payMethod = "카카오페이 결제";
			break;
		case "to":
			payMethod = "토스 결제";
			break;
		case "na":
			payMethod = "네이버페이 결제";
			break;
		case "ra":
			payMethod = "실시간계좌이체";
			break;
		}

		mav.addObject("orderNo", orderList.getOrderNo());
		mav.addObject("orderDate", orderDate);
		mav.addObject("payPrice", totalPrice);
		mav.addObject("payMethod", payMethod);
		mav.setViewName("shop/checkOut/finishPayment");
		return mav;
	}

	@PostMapping("/checkOut.do")
	public ModelAndView checkOut(ModelAndView mav, HttpServletRequest request,
			@RequestParam(value = "check", required = false) String[] cartId,
			@RequestParam(value = "cartIdOne", required = false) String cartIdOne,
			@RequestParam(value = "optionId", required = false) String[] optionId,
			@RequestParam(value = "optionPrice", required = false) String[] optionPrice,
			@RequestParam(value = "count", required = false) String[] count, HttpSession session) {

		Member m = (Member) session.getAttribute("memberLoggedIn");
		ShopMember sMem = shopMemberService.selectOne(m.getMemberId());
		if (sMem.getCouponList() != null) {
			for (int i = 0; i < sMem.getCouponList().size(); i++) {
				String couponId = sMem.getCouponList().get(i).getCouponId();
				CouponInfo couInfo = shopMemberService.selectCouponInfoOne(couponId);
				sMem.getCouponList().get(i).setCouponName(couInfo.getCouponName());
				sMem.getCouponList().get(i).setCouponDetail(couInfo.getCouponDetail());
				sMem.getCouponList().get(i).setDiscountValue(couInfo.getDiscountValue());
				sMem.getCouponList().get(i).setDiscountType(couInfo.getDiscountType());
				sMem.getCouponList().get(i).setMaxValue(couInfo.getMaxValue());
			}

		}

		List<OrderProduct> orderProdList = new ArrayList<>();
		List<Product> prodList = new ArrayList<>();
		List<Integer> totalAmountList = new ArrayList<>();
		List<Integer> totalPriceList = new ArrayList<>();

		// 바로구매
		if (cartId == null) {
			Product product = (Product) session.getAttribute("p");
			// 결제하기에 필요한 객체 생성
			OrderProduct orderProd = new OrderProduct();
			orderProd.setOptionId(optionId);
			orderProd.setProdCount(count);
			orderProd.setProductId(product.getProductId());
			orderProdList.add(orderProd);
			session.setAttribute("orderProdList", orderProdList);

			List<Attachment> attachList = (List<Attachment>) session.getAttribute("attachList");
			List<ProdOption> optionList = new ArrayList<>();
			int totalAmount = 0;
			int totalPrice = 0;
			// 옵션이 있는경우
			if (optionId != null) {

				for (int i = 0; i < optionId.length; i++) {
					String optionID = optionId[i];
					ProdOption option = productService.selectOptionOne(optionID);
					System.out.println("option" + option);
					option.setOptionPrice(Integer.parseInt(optionPrice[i]));
					option.setOptionStock(Integer.parseInt(count[i]));
					totalAmount += Integer.parseInt(count[i]);
					totalPrice += option.getOptionPrice() * Integer.parseInt(count[i]);
					optionList.add(option);
				}
				product.setOptionList(optionList);
				totalAmountList.add(totalAmount);
				totalPriceList.add(totalPrice);
			}
			// 옵션없는경우
			else {
				int stock = Integer.parseInt(count[0]);
				int prodPrice = (product.getPrice() - product.getDiscountPrice()) * stock;
				totalPriceList.add(prodPrice);
				totalAmountList.add(stock);

			}

			product.setAttachList(attachList);
			prodList.add(product);
		}
		// 장바구니 구매
		else {
			// 상품 한개 바로구매
			if (cartIdOne != null) {

				Cart cart = shopMemberService.selectCartOne(cartIdOne);
				Product product = productService.selectProductOne(cart.getProductId());
				prodList.add(product);

				// 결제하기에 필요한 객체 생성
				OrderProduct orderProd = new OrderProduct();
				orderProd.setOptionId(cart.getOptionId());
				orderProd.setProdCount(cart.getProdCount());
				orderProd.setProductId(product.getProductId());
				orderProdList.add(orderProd);
				session.setAttribute("orderProdList", orderProdList);

				List<Attachment> attachList = productService.selectAttachList(cart.getProductId());
				product.setAttachList(attachList);

				List<ProdOption> optionList = new ArrayList<>();
				if (cart.getOptionId() != null) {
					int totalPrice = 0;
					int totalAmount = 0;
					for (int t = 0; t < cart.getOptionId().length; t++) {
						String optId = cart.getOptionId()[t];
						ProdOption prodOption = productService.selectOptionOne(optId);
						optionList.add(prodOption);
						int stock = Integer.parseInt(cart.getProdCount()[t]);
						prodOption.setOptionStock(stock);
						totalAmount += stock;
						totalPrice += (optionList.get(t).getOptionPrice() - product.getDiscountPrice()) * stock;
					}
					totalAmountList.add(totalAmount);
					totalPriceList.add(totalPrice);
					product.setOptionList(optionList);
				} else {
					int stock = Integer.parseInt(cart.getProdCount()[0]);
					int prodPrice = (product.getPrice() - product.getDiscountPrice()) * stock;
					totalPriceList.add(prodPrice);
					totalAmountList.add(stock);
				}

			}
			// 선택된 장바구니 상품만 구매
			else {
				List<Cart> cartList = new ArrayList<>();
				for (int i = 0; i < cartId.length; i++) {
					Cart cart = shopMemberService.selectCartOne(cartId[i]);
					cartList.add(cart);
					Product product = productService.selectProductOne(cart.getProductId());
					prodList.add(product);

					// 결제하기에 필요한 객체 생성
					OrderProduct orderProd = new OrderProduct();
					orderProd.setOptionId(cart.getOptionId());
					orderProd.setProdCount(cart.getProdCount());
					orderProd.setProductId(product.getProductId());
					orderProdList.add(orderProd);

					List<Attachment> attachList = productService.selectAttachList(cart.getProductId());
					List<ProdOption> optionList = new ArrayList<>();
					if (cartList.get(i).getOptionId() != null) {
						for (int t = 0; t < cartList.get(i).getOptionId().length; t++) {
							String optId = cartList.get(i).getOptionId()[t];
							ProdOption prodOption = productService.selectOptionOne(optId);
							int stock = Integer.parseInt(cartList.get(i).getProdCount()[t]);
							prodOption.setOptionStock(stock);
							optionList.add(prodOption);
						}
						product.setOptionList(optionList);
					}

					product.setAttachList(attachList);

					// 옵션이 있는 경우
					if (cartList.get(i).getOptionId() != null) {
						int totalPrice = 0;
						int totalAmount = 0;
						for (int j = 0; j < optionList.size(); j++) {
							int stock = Integer.parseInt(cartList.get(i).getProdCount()[j]);
							totalAmount += stock;
							totalPrice += (optionList.get(j).getOptionPrice() - product.getDiscountPrice()) * stock;
						}
						totalAmountList.add(totalAmount);
						totalPriceList.add(totalPrice);
						product.setOptionList(optionList);

					} else {
						int stock = Integer.parseInt(cartList.get(i).getProdCount()[0]);
						int prodPrice = (product.getPrice() - product.getDiscountPrice()) * stock;
						totalPriceList.add(prodPrice);
						totalAmountList.add(stock);
					}
				}
				session.setAttribute("orderProdList", orderProdList);
			}

		}

		mav.addObject("prodList", prodList);
		mav.addObject("sMem", sMem);
		mav.addObject("totalAmountList", totalAmountList);
		mav.addObject("totalPriceList", totalPriceList);
		mav.setViewName("shop/checkOut/checkOut");
		return mav;
	}

}
