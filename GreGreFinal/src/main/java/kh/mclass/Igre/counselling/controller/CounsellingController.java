package kh.mclass.Igre.counselling.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/counselling")
public class CounsellingController {
	
	@GetMapping("/counselorFind.do")
	public String counselorFind() {
		return "counselling/counselorFind";
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
