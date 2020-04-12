package kh.mclass.IgreMall.QnA.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.QnA.model.service.ProdQnAService;
import kh.mclass.IgreMall.QnA.model.vo.ProdQnA;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/QnA")
public class ProdQnAController {
	@Autowired
	ProdQnAService prodQnAService;
	
	
	/**
	 * 0411 이진희
	 * 
	 * 문의 삭제
	 * 
	 */
	@PostMapping("/deleteQnA.do")
	public ModelAndView deleteQnA(ModelAndView mav,
			@RequestParam(value = "qaId", required = false) String qaId ) {


	int result = prodQnAService.deleteQnA(qaId); 
	
	String viewName ="redirect:/shop/myShopping/QnA/list.do";
	mav.setViewName(viewName);

	return mav;
	}
	/**
	 * 0411 이진희
	 * 
	 * 문의 수정
	 * 
	 */
	@PostMapping("/updateQnA.do")
	public ModelAndView updateQnA(ModelAndView mav, ProdQnA prodQnA,
			@RequestParam(value = "setSecret", required = false) String setSecret ) {

	if(setSecret ==null) {
		prodQnA.setSetSecret("N");
	}
	int result = prodQnAService.updateQnA(prodQnA); 
	
	String viewName ="redirect:/shop/myShopping/QnA/list.do";
	mav.setViewName(viewName);

	return mav;
	}
	/**
	 * 0410 이진희
	 * 
	 * 문의등록
	 */
		@PostMapping("/writeQnA.do")
		public ModelAndView review(ModelAndView mav, ProdQnA prodQnA,
				@RequestParam(value = "setSecret", required = false) String setSecret,
								HttpServletRequest request ) {

		if(setSecret ==null) {
			prodQnA.setSetSecret("N");
		}
		int result = prodQnAService.insertQnA(prodQnA); 
		
		String viewName ="redirect:/shop/product/detail.do?productId="+prodQnA.getProductId();
		mav.setViewName(viewName);

		return mav;
	}

}
