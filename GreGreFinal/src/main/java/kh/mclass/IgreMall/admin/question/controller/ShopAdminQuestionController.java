package kh.mclass.IgreMall.admin.question.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	@RequestMapping("answer.do")
	public ModelAndView answer(ModelAndView mav,String sellerId,String qaId,String answer) {
		Map<String,String> map = new HashMap<String,String >();
		map.put("qaId", qaId);
		map.put("answer", answer);
		map.put("sellerId", sellerId);
		
		System.out.println(map.get(qaId));
		System.out.println(map.get(answer));
		System.out.println(map.get(sellerId));
		int result = questionService.answer(map);
		mav.setViewName("redirect:/shop/admin/question/list.do");
		
		int update = questionService.updateState(map);
		return mav;
	}
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
		int totalQuestion = questionService.totalcount();
		int nTotalQuestion = questionService.ntotalcount();
		int yTotalQuestion = questionService.ytotalcount();
		mav.addObject("totalQ",totalQuestion);
		mav.addObject("ntotalQ",nTotalQuestion);
		mav.addObject("ytotalQ",yTotalQuestion);
		return mav;
	}
	
}
