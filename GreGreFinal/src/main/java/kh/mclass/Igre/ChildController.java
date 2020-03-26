package kh.mclass.Igre;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/child")
public class ChildController {

	
	@GetMapping("/childInfo.do")
	public ModelAndView childInfo(@RequestParam(value = "value",defaultValue = "030102010000") String url) {
		ModelAndView mav = new ModelAndView();
		
		//1. jsoup url connect
				String crawlingURL = "http://www.childcare.go.kr/cpin/contents/"+url+".jsp";
				Document doc;
				try {
					doc = Jsoup.connect(crawlingURL).get();
					// 2. business logic connect in elements
					
					Elements elements = doc.select("div.m_03");
					elements.select("p.mar_t20").remove();
					log.debug(elements.toString());
					
					mav.addObject("element",elements);
					
					
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				mav.addObject("url",url);
				mav.setViewName("child/childInfo");
		
		return mav;
	}

}

