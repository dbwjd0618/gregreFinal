package kh.mclass.IgreMall.admin.event.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.common.util.Utils;
import kh.mclass.IgreMall.admin.coupon.model.service.AdminCouponService;
import kh.mclass.IgreMall.admin.coupon.model.vo.AdminCoupon;
import kh.mclass.IgreMall.admin.coupon.model.vo.CouponPeople;
import kh.mclass.IgreMall.admin.event.service.EventService;
import kh.mclass.IgreMall.admin.event.vo.AttachmentEvent;
import kh.mclass.IgreMall.admin.event.vo.Event;
import kh.mclass.IgreMall.admin.event.vo.EventReply;
import kh.mclass.IgreMall.admin.event.vo.WinnerEvent;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/shop/admin/event")
public class adminEventController {
	@Autowired
	AdminCouponService adminCouponService;
	@Autowired
	EventService eventService;

	@Autowired
	ServletContext servletContext;

	@Autowired
	ResourceLoader resourceLoader;

	
	
	
	@RequestMapping("insertReply.do")
	public int replyWrite(EventReply reply) {
		System.err.println("댓글작성합니다/");
		return eventService.replyWrite(reply);
	}

	@PostMapping("/replyWrite.ajax")
	@ResponseBody
	public int replyWrite1(EventReply reply) {
		System.err.println("댓글작성합니다/");
		return eventService.replyWrite(reply);
	}
	
	@RequestMapping("/sendCoupon.do")
	public ModelAndView selectEvent(ModelAndView mav, Event e,int eventNo,String memberId,String couponId) {
		Event e1 = eventService.selectEvent(e);
		int totalReply = eventService.countReply(e);
		List<EventReply> EPlist = eventService.selectDReply(e);
		
		List<AdminCoupon> clist = adminCouponService.couponList();
		
		
		mav.addObject("clist",clist);
		log.debug("쿠폰리스트{}",clist);
		log.debug("쿠폰지급..{}",EPlist);
		mav.addObject("replyList", EPlist);
		mav.addObject("e", e1);
		mav.addObject("replyCount", totalReply);
		
		
		mav.setViewName("shop/admin/event/sendCoupon");
		return mav;
	}
	@RequestMapping("/view.do")
	public ModelAndView selectEvent(ModelAndView mav, Event e) {
		Event e1 = eventService.selectEvent(e);
		int totalReply = eventService.countReply(e);
		List<EventReply> EPlist = eventService.selectReply(e);
		mav.addObject("replyList", EPlist);
		mav.addObject("e", e1);
		mav.addObject("replyCount", totalReply);
		mav.setViewName("shop/admin/event/eventView");
		return mav;
	}

	
	@RequestMapping("/insert.do")
	public String postWriteEnd(Event post, RedirectAttributes rda, HttpServletRequest request,
							   @RequestParam(value="Thumbnail", required=false) MultipartFile upfile) {
		log.debug("뭐가찍히냥{}",upfile);
		if(!(upfile.isEmpty())) {

			String originFileName = upfile.getOriginalFilename();
			String renamedFileName = Utils.getRenamedFileName(originFileName);
			
			//파일 이동
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/shop/eventImg");
			
			try {
				upfile.transferTo(new File(saveDirectory, renamedFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			post.setThumOrgImg(originFileName);
			post.setThumReImg(renamedFileName);
			
		} else {
			post.setThumOrgImg(null);
			post.setThumReImg(null);
		}
		int result = eventService.insertEvent(post);
		
		rda.addFlashAttribute("msg", result>0?"게시글이 등록되었습니다.":"게시글 등록 중 오류가 발생했습니다.");
		
		return "redirect:/shop/admin/index.do";
	}
	
	
	
//	@RequestMapping("/insert.do")
//	public ModelAndView insertEvent(ModelAndView mav, Event event, HttpServletResponse response,
//			MultipartHttpServletRequest mtfRequest, 
//            HttpServletRequest request) {
//	
//
//		try {
//			MultipartFile file = mtfRequest.getFile("upFile");
//			// 파일명 재생성
//			String mainOriginalFileName = file.getOriginalFilename();
//			String mainRenamedFileName = "";
//			if (!"".equals(mainOriginalFileName)) {
//				mainRenamedFileName = Utils.getRenamedFileName(mainOriginalFileName);
//
//			}
//			
//			event.setThumOrgImg(mainOriginalFileName);
//			event.setThumReImg(mainRenamedFileName);
//			
//		
//			// 파일 이동 경로
//			String saveDirectory1 = request.getServletContext().getRealPath("/resources/upload/shop/eventImg");
//			
//			// 파일 생성.
//			try {
//				file.transferTo(new File(saveDirectory1, mainRenamedFileName));
//			} catch (IllegalStateException | IOException e1) {
//				e1.printStackTrace();
//			}
//			
//			int result = eventService.insertEvent(event);
//		} catch (Exception e1) {
//			log.error("리뷰오류!", e1);
//		}
//
//
//
//		mav.setViewName("shop/admin/event/write");
//		return mav;
//	}

//	@RequestMapping("/insert.do")
//	public ModelAndView insertEvent(
//			@RequestParam(value="upFile", required=false) MultipartFile upfile,
//			ModelAndView mav,Event e,
//			MultipartHttpServletRequest mtfRequest,  
//			HttpServletRequest request,
//			HttpServletResponse response) {
//		System.out.println("오냥;;");
//			System.out.println(e);
//		System.out.println(""+upfile);
//		
//		
//		
//		
//		String mainOriginalFileName = upfile.getOriginalFilename(); // 원본 파일 명
//		String mainRenamedFileName = Utils.getRenamedFileName(mainOriginalFileName);
//		AttachmentEvent attach1 = new AttachmentEvent();
//		attach1.setOriginalImg(mainOriginalFileName);
//		attach1.setRenamedImg(mainRenamedFileName);
//		attach1.setEventNo(e.getEventNo());
//		attach1.setImgType("R");
//		String saveDirectory1 = request.getServletContext().getRealPath("/resources/upload/shop/eventImg");
//		try {
//			upfile.transferTo(new File(saveDirectory1, mainRenamedFileName));
//		} catch (IllegalStateException | IOException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		int result1 = eventService.insertEventImg(attach1);
//		int result = eventService.insertEvent(e);
//		mav.setViewName("shop/admin/event/write");
//		return mav;
//	}
//	

	@GetMapping("/write.do")
	public ModelAndView eventWrite(ModelAndView mav) {
		mav.setViewName("shop/admin/event/write");
//		int result = EventService.insertEvent();
		return mav;
	}

	//
	@GetMapping("event.do")
	public ModelAndView eventList(ModelAndView mav) {
		List<Event> eventList = eventService.eventList();
		mav.setViewName("shop/admin/event/list");
		mav.addObject("el", eventList);
		return mav;
	}
}
