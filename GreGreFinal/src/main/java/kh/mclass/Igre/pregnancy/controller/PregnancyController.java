package kh.mclass.Igre.pregnancy.controller;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/pregnancy")
public class PregnancyController {
	
	@GetMapping("/calendar.do")
	public String calender() {
		return "pregnancy/calendar";
	}
	
	@GetMapping("/prePregnancy.do")
	public ModelAndView prePregnancy(@RequestParam(value="value", defaultValue = "010103010000") String url) {
		ModelAndView mav = new ModelAndView();
		
		//1. jsoup url connect
		String crawlingURL = "http://www.childcare.go.kr/cpin/contents/"+url+".jsp";
		Document doc;
		try {
			doc = Jsoup.connect(crawlingURL).get();
			// 2. business logic connect in elements
			Elements elements = doc.select("div.m_01");
			mav.addObject("element",elements);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		mav.addObject("url",url);
		mav.setViewName("pregnancy/prePregnancy");
		return mav;
	}

}
