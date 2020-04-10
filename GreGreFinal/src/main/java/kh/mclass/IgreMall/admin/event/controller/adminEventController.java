package kh.mclass.IgreMall.admin.event.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.event.service.EventService;
import kh.mclass.IgreMall.admin.event.vo.Event;

@Controller
@RequestMapping("/shop/admin/event")
public class adminEventController {

	@Autowired
	EventService eventService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@GetMapping("/insert.do")
	public ModelAndView insertEvent(ModelAndView mav,Event e ) {
		mav.setViewName("shop/admin/event/write");
	int result = eventService.insertEvent(e);
		return mav;
	}
	@GetMapping("/write.do")
	public ModelAndView eventWrite(ModelAndView mav) {
		mav.setViewName("shop/admin/event/write");
//		int result = EventService.insertEvent();
		return mav;
	}
	
	
	@GetMapping("event.do")
	public ModelAndView eventList(ModelAndView mav){
		mav.setViewName("shop/admin/event/list");
		return mav;
	}
}
