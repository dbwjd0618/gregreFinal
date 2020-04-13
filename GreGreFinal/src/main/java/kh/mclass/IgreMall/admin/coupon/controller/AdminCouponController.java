package kh.mclass.IgreMall.admin.coupon.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.coupon.model.service.AdminCouponService;
import kh.mclass.IgreMall.admin.coupon.model.vo.AdminCoupon;
import kh.mclass.IgreMall.admin.coupon.model.vo.CouponPeople;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/shop/admin/coupon")
@Slf4j
public class AdminCouponController {
	@RequestMapping("/sendCoupon.do")
	public ModelAndView sendCoupon(ModelAndView mav,String memberId,String couponId) {
		System.out.println("찍히냐");
		AdminCoupon c = new AdminCoupon();
		String strMemberId[]= null;
		strMemberId=memberId.split(",");
		
		c.setCouponId(couponId);
				
		c=adminCouponService.selectCoupon(c);
		
		CouponPeople cp = new CouponPeople();
		for(int i=0;i<strMemberId.length;i++) { 
			cp.setCouponState("N");
			cp.setCouponId(c.getCouponId()); cp.setExpireDate(c.getCouponDuration());
			cp.setMemberId(strMemberId[i]);
			
			int result = adminCouponService.sendCoupon(cp);
		}
		return mav;
	}
	
	@RequestMapping("/updateEnd.do")
	public ModelAndView updateEnd (ModelAndView mav) {
	
//		AdminCoupon cp = adminCouponService.selectcurCoupon(c);
//		  for(int i=0;i<strMemberId.length;i++) { cp.setCouponState("N");
//		  cp.setCouponId(c.getCouponId()); cp.setExpireDate(c.getCouponDuration());
//		  cp.setMemberId(memberId);
//		  
//		  int result2 = adminCouponService.sendCoupon(cp); }
		 return mav;
	}
	@Autowired
	AdminCouponService adminCouponService;
	
	@GetMapping("/insert.do")
	public ModelAndView Coupon(ModelAndView mav) {
		
		mav.setViewName("shop/admin/coupon/insertCoupon");
		
		return mav;
	}
	@GetMapping("/update.do")
	public ModelAndView Coupon(ModelAndView mav,String couponId) {
		log.debug("호호호호");
//		AdminCoupon cp = adminCouponService.selectcurCoupon();
		AdminCoupon a = new AdminCoupon();
		a.setCouponId(couponId);
		AdminCoupon b= adminCouponService.selectCoupon(a);
		mav.addObject("b",b);
		
		mav.setViewName("shop/admin/coupon/insertCoupon");
		
		return mav;
	}
	@RequestMapping("/insertEnd.do")
	public ModelAndView insertCoupon(ModelAndView mav, AdminCoupon c,String memberId,
			@RequestParam(value = "couponDuration") Date d,
			AdminCoupon a
			) {
		System.out.println(a);
		log.debug("쿠폰등록한다.");
		log.debug("people={}",memberId);
		System.out.println(d);
		c.setCouponDuration(d);
		
		log.debug("c={}",c);
		int result= adminCouponService.insertCoupon(c);
		
		mav.setViewName("redirect:/shop/admin/coupon/insert.do");
		return mav;
	} 
	@RequestMapping("/list.do")
	public ModelAndView couponList(ModelAndView mav) {
		List<AdminCoupon> list = adminCouponService.couponList();
		mav.addObject("list",list);
		mav.setViewName("shop/admin/coupon/list");
		return mav;
	}
}
