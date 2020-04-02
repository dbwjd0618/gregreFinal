package kh.mclass.IgreMall.admin.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.order.model.vo.OrderList;

@Controller
@RequestMapping("/shop/admin")
public class ShopAdminController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	
	@GetMapping("/index.do")
	public ModelAndView index(ModelAndView mav) {
		
		mav.setViewName("shop/admin/adminIndex");
		return mav;
	}

	
	@GetMapping("/accountBook.do")
	public ModelAndView accountList(ModelAndView mav) {
		
		
		mav.setViewName("shop/admin/accountBook/accountBook");
		return mav; 
	}
	
	//유저항목들
	@GetMapping("/list.do")
	public ModelAndView memberList(ModelAndView mav) {
		mav.setViewName("shop/admin/member/list");
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
		mav.setViewName("shop/admin/board/board");
		return mav; 
	}
}
