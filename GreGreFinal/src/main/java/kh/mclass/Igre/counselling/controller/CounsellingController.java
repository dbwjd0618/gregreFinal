package kh.mclass.Igre.counselling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.counselling.model.service.CounselorService;
import kh.mclass.Igre.counselling.model.vo.CounselorWithFileCount;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/counselling")
public class CounsellingController {
	
	@Autowired
	CounselorService counselorService;
	
	@GetMapping("/counselorFind.do")
	public ModelAndView counselorFind(@RequestParam(value = "cPage", defaultValue = "1")int cPage) {
		
		log.debug("상담사 목록 페이지!");
		ModelAndView mav = new ModelAndView();
		
		final int numPerPage = 5;
		
		List<CounselorWithFileCount> list = counselorService.selectCounselorList(cPage, numPerPage);
		log.debug("list="+list);
		
		int totalContents = counselorService.selectCounselorTotalContents();
		
		mav.addObject("list", list);
		mav.addObject("totalContents", totalContents);
		mav.setViewName("counselling/counselorFind");
		
		return mav;
	}
	
	
	@GetMapping("/bookingMain.do")
	public String bookingMain() {
		return "counselling/bookingMain";
	}
	
	@GetMapping("/bookingPage.do")
	public String bookingPage() {
		return "counselling/bookingPage";
	}
	
}
