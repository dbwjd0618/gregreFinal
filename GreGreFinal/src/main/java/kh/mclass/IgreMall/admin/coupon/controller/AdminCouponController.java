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
import kh.mclass.IgreMall.admin.event.vo.Event;
import kh.mclass.IgreMall.admin.event.vo.EventReply;
import kh.mclass.IgreMall.admin.event.vo.WinnerEvent;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/shop/admin/coupon")
@Slf4j
public class AdminCouponController {
	
	@RequestMapping("/sendECoupon.do")
	public ModelAndView selectEvent1(ModelAndView mav,
			Event e,
			int eventNo,
			String memberId,
			String couponId) {
		System.out.println("일단 찍혀야하는데 ?");
//		Event e1 = eventService.selectEvent(e);
//		int totalReply = eventService.countReply(e);
//		List<EventReply> EPlist = eventService.selectDReply(e);
		
		List<AdminCoupon> clist = adminCouponService.couponList();
		
		//쿠폰 지급
				AdminCoupon c = new AdminCoupon();
				String strMemberId[]= null;
				strMemberId=memberId.split(",");
				c.setCouponId(couponId);//일단이게 널이네 ?
				String rePlace= couponId.replaceFirst(",", "");
				
				c.setCouponId(rePlace);
				c=adminCouponService.selectCoupon(c); 
				System.out.println("쿠폰찍혀야한"+c);
				
				CouponPeople cp = new CouponPeople();
				
				
				WinnerEvent we= new WinnerEvent();
				for(int i=0;i<strMemberId.length;i++) { 
					cp.setCouponState("Y");
					cp.setCouponId(c.getCouponId()); 
					cp.setExpireDate(c.getCouponDuration());
					cp.setMemberId(strMemberId[i]);
					//WinnerEvent 당첨자 저장
					
					we.setEventNo(eventNo);
					we.setMemberId(strMemberId[i]);
					int winnerResult= adminCouponService.WinnerCS(we);
					int result = adminCouponService.sendCoupon(cp);
				}
					
		mav.addObject("clist",clist);
		log.debug("쿠폰리스트{}",clist);
//		log.debug("쿠폰지급..{}",EPlist);
//		mav.addObject("replyList", EPlist);
//		mav.addObject("e", e1);
//		mav.addObject("replyCount", totalReply);
		
		
		mav.setViewName("shop/admin/event/sendCoupon");
		return mav;
	}
	@RequestMapping("/sendECoupon1.do")
	public ModelAndView sendECoupon(ModelAndView mav,String memberId,String couponId) {
		System.out.println("찍히냐");
		AdminCoupon c = new AdminCoupon();
		String strMemberId[]= null;
		strMemberId=memberId.split(",");
		
		c.setCouponId(couponId);
				
		c=adminCouponService.selectCoupon(c);
		
		CouponPeople cp = new CouponPeople();
		for(int i=0;i<strMemberId.length;i++) { 
			cp.setCouponState("Y");
			 cp.setCouponId(c.getCouponId());
			cp.setExpireDate(c.getCouponDuration());
			cp.setMemberId(strMemberId[i]);
			
			int result = adminCouponService.sendCoupon(cp);
		}
		return mav;
	}
	
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
			cp.setCouponState("Y");
			cp.setCouponId(c.getCouponId()); 
			cp.setExpireDate(c.getCouponDuration());
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
	public ModelAndView Coupon(ModelAndView mav,
			String couponId) {
		log.debug("호호호호");
//		AdminCoupon cp = adminCouponService.selectcurCoupon();
		AdminCoupon a = new AdminCoupon();
		a.setCouponId(couponId);
		AdminCoupon b= adminCouponService.selectCoupon(a);
		System.err.println(b);
		mav.addObject("b",b);
		
		mav.setViewName("shop/admin/coupon/sendCoupon");
		
		return mav;
	}
	@RequestMapping("/insertEnd.do")
	public ModelAndView insertCoupon(ModelAndView mav, AdminCoupon c,String memberId
			
			) {
		log.debug("쿠폰등록한다.");
		log.debug("people={}",memberId);
		
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
