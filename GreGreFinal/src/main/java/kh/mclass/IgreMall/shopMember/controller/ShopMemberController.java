package kh.mclass.IgreMall.shopMember.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.IgreMall.order.model.service.OrderService;
import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.order.model.vo.OrderProduct;
import kh.mclass.IgreMall.order.model.vo.PayAccountInfo;
import kh.mclass.IgreMall.order.model.vo.PaymentInfo;
import kh.mclass.IgreMall.product.model.service.ProductService;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.review.model.service.ProdReviewService;
import kh.mclass.IgreMall.review.model.vo.ProdReview;
import kh.mclass.IgreMall.shopMember.model.service.ShopMemberService;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/myShopping")
public class ShopMemberController {

	@Autowired
	ShopMemberService shopMemberService;
	@Autowired
	ProductService productService;
	@Autowired
	OrderService orderService;
	@Autowired
	ProdReviewService reviewService;

	/**
	 * 0405 이진희
	 * 
	 * 장바구니 옵션 삭제
	 * 
	 * @return
	 */
	@PostMapping("/optionDelete.do")
	@ResponseBody
	public Map<String, Object> optionDelete(@RequestParam(value = "optionId", required = false) String optionId,
			@RequestParam(value = "cartId", required = false) String cartId, HttpSession session) {

		Cart cart = shopMemberService.selectCartOne(cartId);
		List<String> optionIdList = new ArrayList<>(Arrays.asList(cart.getOptionId()));
		List<String> prodCountList = new ArrayList<>(Arrays.asList(cart.getProdCount()));
		int idx = optionIdList.indexOf(optionId);

		// 옵션 id 삭제
		optionIdList.remove(optionId);
		cart.setOptionId(optionIdList.toArray(new String[optionIdList.size()]));
		// 옵션수량 삭제
		prodCountList.remove(idx);
		cart.setProdCount(prodCountList.toArray(new String[prodCountList.size()]));

		int result = shopMemberService.updateCartOne(cart);

		Map<String, Object> map = new HashMap<>();
		if (result > 0) {
			map.put("cartId", cartId);
			map.put("optionId", optionId);
		}

		return map;
	}

	/**
	 * 0403 이진희
	 * 
	 * 장바구니 담기
	 * 
	 * @return
	 */
	@PostMapping("/cartInsert.do")
	@ResponseBody
	public Object cart(HttpServletRequest request,
			@RequestParam(value = "optionIdList[]", required = false) List<String> optionIdList,
			@RequestParam(value = "countList[]", required = false) List<String> countList,
			@RequestParam(value = "memberId") String memberId) {

		Cart cart = null;
		HttpSession session = request.getSession();
		Product product = (Product) session.getAttribute("p");

		String message = "장바구니 담기 실패";
		String[] optionId = new String[optionIdList.size()];
		String[] count = new String[optionIdList.size()];
		if (!optionIdList.get(0).equals(product.getProductId())) {
			for (int i = 0; i < optionIdList.size(); i++) {
				optionId[i] = optionIdList.get(i);
				count[i] = countList.get(i);
			}
			cart = new Cart(null, memberId, product.getProductId(), optionId, count, null);
			int result = shopMemberService.insertCart(cart);
			log.debug("장바구니={}", cart);

			if (result == 1) {
				message = "장바구니 담기 성공!";
			}

		} else {

			count[0] = countList.get(0);

			cart = new Cart(null, memberId, product.getProductId(), null, count, null);
			int result = shopMemberService.insertCart(cart);
			if (result == 1) {
				message = "장바구니 담기 성공!";
			}
		}

		// 리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();

		// 성공했다고 처리
		retVal.put("message", message);

		return retVal;
	}

	/**
	 * 0403 이진희
	 * 
	 * 장바구니 목록 출력
	 */
	@GetMapping("/cart.do")
	public ModelAndView cart(ModelAndView mav, HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		List<Cart> cartList = shopMemberService.selectCartList(m.getMemberId());
		List<String> allPriceList = new ArrayList<>();

		for (int i = 0; i < cartList.size(); i++) {
			String productId = cartList.get(i).getProductId();
			Product p = productService.selectProductOne(productId);
			List<Attachment> attachList = productService.selectAttachList(productId);
			List<ProdOption> optionList = new ArrayList<>();
			if (cartList.get(i).getOptionId() != null) {
				for (int t = 0; t < cartList.get(i).getOptionId().length; t++) {
					String optionId = cartList.get(i).getOptionId()[t];
					ProdOption prodOption = productService.selectOptionOne(optionId);

					optionList.add(prodOption);
				}

			}

			p.setAttachList(attachList);

			cartList.get(i).setOptionList(optionList);
			cartList.get(i).setProduct(p);
			System.out.println("optionList=" + optionList);
			// 옵션이 있는 경우
			if (cartList.get(i).getOptionId() != null) {
				int optionPrice = 0;

				for (int j = 0; j < optionList.size(); j++) {
					int stock = Integer.parseInt(cartList.get(i).getProdCount()[j]);
					optionPrice += (optionList.get(j).getOptionPrice() - p.getDiscountPrice()) * stock;
				}

				allPriceList.add(Integer.toString(optionPrice));

			} else {

				int stock = Integer.parseInt(cartList.get(i).getProdCount()[0]);
				int prodPrice = (p.getPrice() - p.getDiscountPrice()) * stock;
				String price = Integer.toString(prodPrice);
				allPriceList.add(price);
			}
		}

		mav.addObject("cartList", cartList);
		mav.addObject("allPriceList", allPriceList);
		mav.setViewName("shop/myShopping/cart/list");
		return mav;
	}

	/**
	 * 0408 이진희
	 * 
	 * 주문확인
	 * 
	 * @return
	 */
	@GetMapping("/order/list.do")
	public ModelAndView orderList(ModelAndView mav, HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		String memberId = m.getMemberId();
		List<OrderList> orderList = orderService.selectListOrder(memberId);
		int[] deliStateCount = new int[5];

		for (int i = 0; i < orderList.size(); i++) {
			String orderNo = orderList.get(i).getOrderNo();
			List<OrderProduct> orderProdList = orderService.selectOrderProdList(orderNo);

			for (int j = 0; j < orderProdList.size(); j++) {
				String prodId = orderProdList.get(j).getProductId();
				Product product = productService.selectProductOne(prodId);
				orderProdList.get(j).setProductName(product.getProductName());
				orderProdList.get(j).setProductBrand(product.getBrandName());

				// review 불러오기
				List<ProdReview> myReviewList = reviewService.selectListMyReview(memberId);
				for (int mIdx = 0; mIdx < myReviewList.size(); mIdx++) {

					if (prodId.equals(myReviewList.get(mIdx).getProductId())
							&& orderNo.equals(myReviewList.get(mIdx).getOrderNo())) {
						String reviewId = myReviewList.get(mIdx).getReviewId();
						orderProdList.get(j).setReviewId(reviewId);
					} else {
						String reviewId = "";
						orderProdList.get(j).setReviewId(reviewId);
					}
				}
				// 리뷰 아이디 가져오기

				switch (orderList.get(i).getDeliveryState()) {

				case "A":
					deliStateCount[0] += 1;
					break;
				case "B":
					deliStateCount[1] += 1;
					break;
				case "C":
					deliStateCount[2] += 1;
					break;
				case "D":
					deliStateCount[3] += 1;
					break;
				case "E":
					deliStateCount[4] += 1;
					break;

				}

				List<Attachment> attachList = productService.selectAttachList(product.getProductId());

				for (int k = 0; k < attachList.size(); k++) {
					if (attachList.get(k).getImgType().equals("R")) {

						orderProdList.get(j).setRenamedImg(attachList.get(k).getRenamedImg());
					}
				}

				if (orderProdList.get(j).getOptionId() != null) {
					String[] optionName = new String[orderProdList.get(j).getOptionId().length];
					String[] optionPrice = new String[orderProdList.get(j).getOptionId().length];
					String[] optionValue = new String[orderProdList.get(j).getOptionId().length];
					for (int t = 0; t < orderProdList.get(j).getOptionId().length; t++) {
						String optionId = orderProdList.get(j).getOptionId()[t];
						ProdOption opt = productService.selectOptionOne(optionId);
						optionName[t] = opt.getOptionName();
						optionValue[t] = opt.getOptionValue();
						int stock = Integer.parseInt(orderProdList.get(j).getProdCount()[t]);
						int optPrice = (opt.getOptionPrice() - product.getDiscountPrice()) * stock;
						optionPrice[t] = Integer.toString(optPrice);
					}
					orderProdList.get(j).setOptionValue(optionValue);
					orderProdList.get(j).setOptionName(optionName);
					orderProdList.get(j).setOptionPrice(optionPrice);
					orderProdList.get(j).setDeliveryFee(Integer.parseInt(product.getDeliveryFee()));

				} else {
					String[] optionPrice = new String[1];
					int price = product.getPrice() - product.getDiscountPrice();
					optionPrice[0] = Integer.toString(price);
					orderProdList.get(j).setOptionPrice(optionPrice);
					orderProdList.get(j).setDeliveryFee(Integer.parseInt(product.getDeliveryFee()));

				}

			}

			orderList.get(i).setOrderProdList(orderProdList);

			PaymentInfo paymentInfo = orderService.selectPaymentInfo(orderNo);
			orderList.get(i).setPaymentInfo(paymentInfo);

			switch (orderList.get(i).getDeliveryState()) {

			case "A":
				orderList.get(i).setDeliveryState("입금대기");
				break;
			case "B":
				orderList.get(i).setDeliveryState("결제완료");
				break;
			case "C":
				orderList.get(i).setDeliveryState("배송준비");
				break;
			case "D":
				orderList.get(i).setDeliveryState("배송중");
				break;
			case "E":
				orderList.get(i).setDeliveryState("배송완료");
				break;

			}

		}

		mav.addObject("orderList", orderList);
		mav.addObject("deliStateCount", deliStateCount);
		mav.setViewName("shop/myShopping/order/list");
		return mav;
	}

	/**
	 * 0408 이진희
	 * 
	 * 주문상세정보
	 * 
	 * @return
	 */
	@GetMapping("/order/detail.do")
	public ModelAndView orderDetail(ModelAndView mav,
			@RequestParam(value = "orderNo", required = false) String orderNo) {

		OrderList orderList = orderService.selectOrderList(orderNo);
		PaymentInfo paymentInfo = orderService.selectPaymentInfo(orderNo);
		List<OrderProduct> orderProdList = orderService.selectOrderProdList(orderNo);
		orderList.setPaymentInfo(paymentInfo);

		for (int j = 0; j < orderProdList.size(); j++) {
			Product product = productService.selectProductOne(orderProdList.get(j).getProductId());
			orderProdList.get(j).setProductName(product.getProductName());
			orderProdList.get(j).setProductBrand(product.getBrandName());
			
			List<Attachment> attachList = productService.selectAttachList(product.getProductId());

			for (int k = 0; k < attachList.size(); k++) {
				if (attachList.get(k).getImgType().equals("R")) {

					orderProdList.get(j).setRenamedImg(attachList.get(k).getRenamedImg());
				}
			}

			if (orderProdList.get(j).getOptionId() != null) {
				String[] optionName = new String[orderProdList.get(j).getOptionId().length];
				String[] optionPrice = new String[orderProdList.get(j).getOptionId().length];
				String[] optionValue = new String[orderProdList.get(j).getOptionId().length];
				for (int t = 0; t < orderProdList.get(j).getOptionId().length; t++) {
					String optionId = orderProdList.get(j).getOptionId()[t];
					ProdOption opt = productService.selectOptionOne(optionId);
					optionName[t] = opt.getOptionName();
					optionValue[t] = opt.getOptionValue();
					int stock = Integer.parseInt(orderProdList.get(j).getProdCount()[t]);
					int optPrice = (opt.getOptionPrice() - product.getDiscountPrice()) * stock;
					optionPrice[t] = Integer.toString(optPrice);
				}
				orderProdList.get(j).setOptionValue(optionValue);
				orderProdList.get(j).setOptionName(optionName);
				orderProdList.get(j).setOptionPrice(optionPrice);
				orderProdList.get(j).setDeliveryFee(Integer.parseInt(product.getDeliveryFee()));

			} else {
				String[] optionPrice = new String[1];
				int price = product.getPrice() - product.getDiscountPrice();
				optionPrice[0] = Integer.toString(price);
				orderProdList.get(j).setOptionPrice(optionPrice);
				orderProdList.get(j).setDeliveryFee(Integer.parseInt(product.getDeliveryFee()));

			}
		}
		switch (orderList.getDeliveryState()) {

		case "A":
			orderList.setDeliveryState("입금대기");
			break;
		case "B":
			orderList.setDeliveryState("결제완료");
			break;
		case "C":
			orderList.setDeliveryState("배송준비");
			break;
		case "D":
			orderList.setDeliveryState("배송중");
			break;
		case "E":
			orderList.setDeliveryState("배송완료");
			break;

		}

		orderList.setOrderProdList(orderProdList);

		if ("ac".equals(orderList.getPayMethod())) {
			PayAccountInfo payAccInfo = orderService.selectPayAccInfo(orderNo);
			mav.addObject("payAccInfo", payAccInfo);
		}

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
		System.out.println("orderProdList =" + orderProdList);
		System.out.println("paymentInfo=" + paymentInfo);
		System.out.println("orderList=" + orderList);
		mav.addObject("payMethod", payMethod);
		mav.addObject("orderList", orderList);
		mav.setViewName("shop/myShopping/order/detail");
		return mav;
	}

	@GetMapping("/wish/list.do")
	public ModelAndView wishList(ModelAndView mav) {

		mav.setViewName("shop/myShopping/wish/list");
		return mav;
	}

	@GetMapping("/QnA/list.do")
	public ModelAndView QnAList(ModelAndView mav) {
		mav.setViewName("shop/myShopping/QnA/list");
		return mav;
	}

	/**
	 * 0410 이진희
	 * 
	 * 마이쇼핑 나의 리뷰보기
	 */
	@GetMapping("/review/list.do")
	public ModelAndView reviewList(ModelAndView mav, HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		String memberId = m.getMemberId();

		// review 불러오기
		List<ProdReview> myReviewList = reviewService.selectListMyReview(memberId);
		for (int i = 0; i < myReviewList.size(); i++) {
			String[] optionName = new String[myReviewList.get(i).getOptionId().length];
			Product product =productService.selectProductOne(myReviewList.get(i).getProductId());
			
			myReviewList.get(i).setBrandName(product.getBrandName());
			myReviewList.get(i).setProductName(product.getProductName());
			List<Attachment> attachList = productService.selectAttachList(product.getProductId());

			for (int k = 0; k < attachList.size(); k++) {
				if (attachList.get(k).getImgType().equals("R")) {
					myReviewList.get(i).setProdImg(attachList.get(k).getRenamedImg());
				}
			}
			for (int j = 0; j < myReviewList.get(i).getOptionId().length; j++) {
				ProdOption option = productService.selectOptionOne(myReviewList.get(i).getOptionId()[j]);
				optionName[j] = option.getOptionValue().replaceAll(",", "/");
			}
			myReviewList.get(i).setOptionName(optionName);
		}
		mav.addObject("reviewList", myReviewList);
		mav.setViewName("shop/myShopping/review/list");
		return mav;
	}

	@GetMapping("/event/list.do")
	public ModelAndView eventList(ModelAndView mav, Model model) {
		mav.setViewName("shop/myShopping/event/list");
		return mav;
	}

	@GetMapping("/coupon/list.do")
	public ModelAndView couponList(ModelAndView mav) {
		mav.setViewName("shop/myShopping/coupon/list");
		return mav;
	}
}
