package kh.mclass.Igre.pregnancy.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.member.model.service.MemberService;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.pregnancy.model.service.PregnancyService;

@Controller
@RequestMapping("/pregnancy")
public class PregnancyController {
	
	@Autowired
	PregnancyService pregnancyService;
	
	@GetMapping("/calendar.do")
	public Model calender(Model model,@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
		
		model.addAttribute("memberLoggedIn",memberLoggedIn);
		return model;
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
	
	@PostMapping("/menses.do")
	public Model InputMenses(@RequestParam(value = "ageStart") Date ageStart, @RequestParam(value="ageEnd") Date ageEnd,
							@RequestParam(value="cycle") int cycle, @RequestParam(value="startDay") Date startDay,
							@SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn, Model model) {

		
		Map<String, Object> menses = new HashMap<String, Object>();
		menses.put("memberId",memberLoggedIn.getMemberId());
		menses.put("ageStart", ageStart);
		menses.put("ageEnd", ageEnd);
		menses.put("cycle", cycle);
		menses.put("startDay", startDay);
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(startDay);
		calendar.add(Calendar.DATE,25);
		
		Date nextMenses = new Date(calendar.getTimeInMillis());
		System.out.println(nextMenses);
		
		menses.put("nextMemses", nextMenses);
		
		int resultTable = pregnancyService.findTable(memberLoggedIn);
		
		if(resultTable != 0 ) {
			int result = pregnancyService.insertMenses(menses);
		}
		
		model.addAttribute("result",resultTable );
		return model;
	}
	
}
