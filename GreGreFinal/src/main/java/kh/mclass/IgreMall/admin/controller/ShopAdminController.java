package kh.mclass.IgreMall.admin.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.member.model.vo.BizMember;
import kh.mclass.IgreMall.admin.info.model.service.InfoService;
import kh.mclass.IgreMall.admin.info.model.vo.ShopAdmin;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/shop/admin")
@Slf4j
public class ShopAdminController {

	@Autowired
	InfoService infoService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	
	@GetMapping("/index.do")
	public ModelAndView index(ModelAndView mav,
							@SessionAttribute (value="bizmemberLoggedIn")BizMember  biz) {
		int TotalCount= infoService.totalSell();
		int totalOrder= infoService.totalOrder();
		int totalQa= infoService.totalQa();
		mav.addObject("totalPrice",TotalCount);
		mav.addObject("totalOrder",totalOrder);
		mav.addObject("totalQa",totalQa);
		mav.addObject("biz",biz);
		mav.setViewName("shop/admin/adminIndex");
		
		return mav;
	}

	
	@GetMapping("/accountBook.do")
	public ModelAndView accountList(ModelAndView mav) {
		
		mav.setViewName("shop/admin/accountBook/accountBook");
		return mav; 
	}
	
	//유저항목들
	@GetMapping("/adminInfo.do")
	public ModelAndView memberList(ModelAndView mav,
			@SessionAttribute (value="bizmemberLoggedIn")BizMember  biz) {
		String sellerId=biz.getCmemberId();
		ShopAdmin s = infoService.selectSeller(sellerId);
		log.debug("샵어드민은?={}",s);
		mav.addObject("s",s);
		mav.setViewName("shop/admin/member/adminInfo");
		
		return mav; 
	}
	
	@GetMapping("/ban.do")
	public ModelAndView memberbanList(ModelAndView mav) {
		mav.setViewName("shop/admin/member/banList");
		return mav; 
	}
	@GetMapping("/withdrawll.do")
	public ModelAndView withdrawllList(ModelAndView mav) {
		mav.setViewName("shop/admin/member/withdrawllList");
		return mav; 
	}
	
	//게시판관련
	@GetMapping("/board.do")
	public ModelAndView boardList(ModelAndView mav) {
		System.err.println("게시판으로 넘어갑니다.");
		mav.setViewName("shop/admin/board/board");
		return mav; 
	}
}
