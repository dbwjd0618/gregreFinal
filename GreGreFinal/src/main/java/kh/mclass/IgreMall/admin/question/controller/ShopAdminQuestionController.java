package kh.mclass.IgreMall.admin.question.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.question.model.service.ShopAdminQuestionService;
import kh.mclass.IgreMall.admin.question.model.vo.AdminQnA;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop/admin/question")
public class ShopAdminQuestionController {

	@Autowired
	ShopAdminQuestionService questionService;
	@RequestMapping("viewQnA.do")
	public ModelAndView QnAlist(ModelAndView mav,String qaId) {
		AdminQnA qa = questionService.selectQnA(qaId);
		mav.addObject("qa",qa);
		mav.setViewName("shop/admin/board/question/viewQnA");
		return mav;
	}
	
	@RequestMapping("list.do")
	public ModelAndView QnAlist(ModelAndView mav) {
		
		List<AdminQnA> list = questionService.QnAlist();
		
		mav.addObject("list",list);
		mav.setViewName("shop/admin/board/question/list");
		log.debug("list={}",list);
		return mav;
	}
	
}
