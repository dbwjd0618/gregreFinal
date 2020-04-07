package kh.mclass.IgreMall.event.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop/event")
public class EventController {
	
	@GetMapping("/list.do")
	public ModelAndView eventList(ModelAndView mav) {
		mav.setViewName("shop/event/list");
		return mav;
	}
	@GetMapping("/detail.do")
	public ModelAndView eventDetail(ModelAndView mav) {
		mav.setViewName("shop/event/detail");
		return mav;
	}
	@GetMapping("/noticeDetail.do")
	public ModelAndView eventNoticeDetail(ModelAndView mav) {
		mav.setViewName("shop/event/noticeDetail");
		return mav;
	}
	
	
	
}
