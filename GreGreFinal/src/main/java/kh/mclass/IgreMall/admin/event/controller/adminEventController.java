package kh.mclass.IgreMall.admin.event.controller;

import java.util.List;

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
	@RequestMapping("/view.do")
	public ModelAndView selectEvent(ModelAndView mav,Event e ) {
		Event e1 = eventService.selectEvent(e);
		mav.addObject("e",e1);
		mav.setViewName("shop/admin/event/eventView");
		return mav;
	}
	@RequestMapping("/insert.do")
	public ModelAndView insertEvent(ModelAndView mav,Event e ) {
		System.out.println("오냥;;");
		System.out.println(e);
		int result = eventService.insertEvent(e);
		
		mav.setViewName("shop/admin/event/write");
		
		return mav;
	}
	@GetMapping("/write.do")
	public ModelAndView eventWrite(ModelAndView mav) {
		mav.setViewName("shop/admin/event/write");
//		int result = EventService.insertEvent();
		return mav;
	}
	
	//
	@GetMapping("event.do")
	public ModelAndView eventList(ModelAndView mav){
		 List<Event> eventList= eventService.eventList(); 
		mav.setViewName("shop/admin/event/list");
		 mav.addObject("el",eventList); 
		return mav;
	}
}
