package kh.mclass.Igre.pregnancy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/pregnancy")
public class PregnancyController {
	
	@GetMapping("/calendar.do")
	public String calender() {
		return "pregnancy/calendar";
	}
	
	@GetMapping("/prePregnancy.do")
	public String prePregnancy() {
		
		return "pregnancy/prePregnancy";
	}

}
