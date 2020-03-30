package kh.mclass.Igre.counselling.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.counselling.model.service.CounselorService;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/counselling")
public class CounsellingController {
	
	@Autowired
	CounselorService counselorService;
	
	@GetMapping("/counselorFind.do")
	public ModelAndView counselorFind(@RequestParam(value = "cPage", defaultValue = "1")int cPage, HttpServletRequest request, HttpServletResponse response) {
		
		log.debug("상담사 목록 페이지!");
		ModelAndView mav = new ModelAndView();
		
		final int numPerPage =5;
		
		List<Counselor> list = counselorService.selectCounselorList(cPage, numPerPage);
		
		int totalContents = counselorService.selectCounselorTotalContents();
		
		mav.addObject("list", list);
		mav.addObject("totalContents", totalContents);
		mav.setViewName("counselling/counselorFind");
		
		return mav;
	}
	
	
	@GetMapping("/bookingMain.do")
	public void bookingMain(@RequestParam("advisId") String advisId, Model model) {
		
		Counselor counselor = counselorService.selectOne(advisId);
		model.addAttribute("counselor", counselor);
		
	}
	
	@GetMapping("/bookingPage.do")
	public void bookingPage(@RequestParam("advisId") String advisId, Model model) {
	
		Counselor counselor = counselorService.selectOne(advisId);
		model.addAttribute("counselor", counselor);
	
		
	}
	
}
