package kh.mclass.Igre.find.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/find")
public class FindController {
	
	@GetMapping("/careCenter.do")
	public String careCenter() {
		return "find/careCenter";
	}
	
	@GetMapping("/serviceCenter.do")
	public String serviceCenter() {
		return "find/serviceCenter";
	}
	@GetMapping("/hospital.do")
	public String hospital() {
		return "find/hospital";
	}
	@GetMapping("/pharmacy.do")
	public String pharmacy() {
		return "find/pharmacy";
	}

}
