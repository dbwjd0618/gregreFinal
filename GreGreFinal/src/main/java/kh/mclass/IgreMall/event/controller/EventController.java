package kh.mclass.IgreMall.event.controller;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.event.vo.EventReply;
import kh.mclass.IgreMall.event.model.service.ShopEventService;
import kh.mclass.IgreMall.event.model.vo.ShopEvent;

@Controller
@RequestMapping("/shop/event")
public class EventController {
	
	@Autowired
	ShopEventService shopEventService;
	
	@PostMapping("/replyWrite.ajax")
	@ResponseBody
	public int replyWrite1(EventReply reply) {
		System.err.println("댓글작성합니다/");
		return shopEventService.replyWrite(reply);

	}
	
	
	@GetMapping("/list.do")
	public ModelAndView eventList(ModelAndView mav) {
		List<ShopEvent> list =shopEventService.selectList();
		mav.addObject("list",list);
		mav.setViewName("shop/event/list");
		return mav;
	}
	@GetMapping("/detail.do")
	public ModelAndView eventDetail(ModelAndView mav,int eventNo) {
		ShopEvent s=shopEventService.selectOne(eventNo);
		int totalReply = shopEventService.countReply(eventNo);
		List<EventReply> EPlist = shopEventService.selectReply(eventNo);
		mav.addObject("replyList",EPlist);
		mav.addObject("replyCount",totalReply);
		mav.addObject("s",s);
//		Calendar cal = Calendar.getInstance();
	
		return mav;
	}
	@GetMapping("/noticeDetail.do")
	public ModelAndView eventNoticeDetail(ModelAndView mav) {
		mav.setViewName("shop/event/noticeDetail");
		return mav;
	}
	
	
	
}
