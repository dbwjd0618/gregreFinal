package kh.mclass.IgreMall.order.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.order.model.service.OrderService;
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
	
	@PostMapping("/checkOut.do")
	public ModelAndView checkOut(ModelAndView mav,
							HttpServletRequest request,
							@RequestParam(value = "cartId", required = false) String[] cartId,
							@RequestParam(value = "optionId", required = false) String[] optionId,
							@RequestParam(value = "optionPrice", required = false) String[] optionPrice,
							@RequestParam(value = "count", required = false) String[] count,
							HttpSession session) {
		
		Member m = (Member) session.getAttribute("memberLoggedIn");
		ShopMember sMem = shopMemberService.selectOne(m.getMemberId());
		for(int i=0; i<sMem.getCouponList().size();i++) {
			String couponId = sMem.getCouponList().get(i).getCouponId();
			CouponInfo couInfo = shopMemberService.selectCouponInfoOne(couponId);
			sMem.getCouponList().get(i).setCouponName(couInfo.getCouponName());
			sMem.getCouponList().get(i).setCouponDetail(couInfo.getCouponDetail());
			sMem.getCouponList().get(i).setDiscountValue(couInfo.getDiscountValue());
			sMem.getCouponList().get(i).setDiscountType(couInfo.getDiscountType());
			sMem.getCouponList().get(i).setMaxValue(couInfo.getMaxValue());
		}
		
		log.debug("sMem={}",sMem);
		List<Product> prodList = new ArrayList<>();
		List<Integer> totalAmountList = new ArrayList<>();
		List<Integer> totalPriceList = new ArrayList<>();
		if(cartId == null) {
			Product product = (Product)session.getAttribute("p");
			prodList.add(product);
			List<Attachment> attachList = (List<Attachment>)session.getAttribute("attachList");
			List<ProdOption> optionList = new ArrayList<>();
			int totalAmount = 0;
			int totalPrice = 0;
			if(optionId !=null) {
				for(int i=0; i<optionId.length;i++) {
					String optionID = optionId[i];
					ProdOption option = productService.selectOptionOne(optionID);
					option.setOptionPrice(Integer.parseInt(optionPrice[i]));
					option.setOptionStock(Integer.parseInt(count[i]));
					totalAmount+=Integer.parseInt(count[i]);
					totalPrice+=Integer.parseInt(optionPrice[i])*Integer.parseInt(count[i]);
					optionList.add(option);
				}
				product.setOptionList(optionList);
				totalAmountList.add(totalAmount);
				totalPriceList.add(totalPrice);
			}else {
				int stock = Integer.parseInt(count[0]);
				int prodPrice = (product.getPrice()-product.getDiscountPrice())*stock;
				totalPriceList.add(prodPrice);
				totalAmountList.add(stock);
				
			}
			product.setAttachList(attachList);
		
			
		}else {
			List<Cart> cartList = new ArrayList<>();
			for(int i=0; i<cartId.length;i++) {
				Cart cart = shopMemberService.selectCartOne(cartId[i]); 
				cartList.add(cart);
				Product product = productService.selectProductOne(cart.getProductId());
				prodList.add(product);
				
				List<Attachment> attachList = productService.selectAttachList(cart.getProductId());
				List<ProdOption> optionList = new ArrayList<>();
			    if(cartList.get(i).getOptionId() != null) {
			    	for(int t=0; t<cartList.get(i).getOptionId().length;t++) {
			    		String optId = cartList.get(i).getOptionId()[t];
			    		ProdOption prodOption = productService.selectOptionOne(optId);
			    		optionList.add(prodOption);
			    	}
			    	product.setOptionList(optionList);
			    }
				
				product.setAttachList(attachList);
		
				//옵션이 있는 경우
				if (cartList.get(i).getOptionId() != null) {
					int totalPrice=0;
		
					for(int j=0;j<optionList.size();j++) {
						int stock = Integer.parseInt(cartList.get(i).getProdCount()[j]);
					
						totalPrice += (optionList.get(j).getOptionPrice() - product.getDiscountPrice())*stock;
					}
					totalPriceList.add(totalPrice);
					
				}else {
					int stock = Integer.parseInt(cartList.get(i).getProdCount()[0]);
					int prodPrice = (product.getPrice()-product.getDiscountPrice())*stock;
					totalPriceList.add(prodPrice);
					totalAmountList.add(stock);
				}
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
