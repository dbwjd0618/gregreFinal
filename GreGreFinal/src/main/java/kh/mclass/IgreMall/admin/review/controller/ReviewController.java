package kh.mclass.IgreMall.admin.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop/admin/review")
public class ReviewController {

	
	@RequestMapping("/list.do")
	public ModelAndView list(ModelAndView mav) {
		
		mav.setViewName("shop/admin/board/review");
		return mav;
	}
}
