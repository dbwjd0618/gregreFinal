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

import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.order.model.service.OrderService;
import kh.mclass.IgreMall.product.model.service.ProductService;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.shopMember.model.service.ShopMemberService;
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
							@RequestParam(value = "optionId", required = false) String[] optionId,
							@RequestParam(value = "optionPrice", required = false) String[] optionPrice,
							@RequestParam(value = "count", required = false) String[] count,
							 String memberId) {
	    
		ShopMember sMem = shopMemberService.selectOne(memberId);
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
		
	    HttpSession session = request.getSession();
		Product product = (Product)session.getAttribute("p");
		List<Attachment> attachList = (List<Attachment>)session.getAttribute("attachList");
		List<ProdOption> optionList = new ArrayList<>();
		int totalAmount = 0;
		int totalPrice = 0;
		for(int i=0; i<optionId.length;i++) {
			String optionID = optionId[i];
			ProdOption option = productService.selectOptionOne(optionID);
			option.setOptionPrice(Integer.parseInt(optionPrice[i]));
			option.setOptionStock(Integer.parseInt(count[i]));
			totalAmount+=Integer.parseInt(count[i]);
			totalPrice+=Integer.parseInt(optionPrice[i])*Integer.parseInt(count[i]);
			optionList.add(option);
		}
			
		mav.addObject("sMem", sMem);
		mav.addObject("p", product);
		mav.addObject("sMem", sMem);
		mav.addObject("totalAmount", totalAmount);
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("optionList", optionList);
		mav.addObject("attachList", attachList);
		mav.setViewName("shop/checkOut/checkOut");
		return mav;
	}
	
	
}
