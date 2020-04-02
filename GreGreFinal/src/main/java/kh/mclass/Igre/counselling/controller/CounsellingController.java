package kh.mclass.Igre.counselling.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.counselling.model.service.CounselorService;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.counselling.model.vo.reviewStar;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/counselling")
public class CounsellingController {
	
	@Autowired
	CounselorService counselorService;
	
	@GetMapping("/counselorFind.do")
	public ModelAndView counselorFind(@RequestParam(value = "cPage", defaultValue = "1")int cPage,
										HttpServletRequest request, HttpServletResponse response) {
		
		log.debug("상담사 목록 페이지!");
		ModelAndView mav = new ModelAndView();
		
		final int numPerPage =5;
		
		List<Counselor> list = counselorService.selectCounselorList(cPage, numPerPage);
		
		int totalContents = counselorService.selectCounselorTotalContents();
		
		mav.addObject("list", list);
		System.out.println(list);
		mav.addObject("totalContents", totalContents);
		mav.setViewName("counselling/counselorFind");
		
		return mav;
	}
	
	
	@GetMapping("/bookingMain.do")
	public ModelAndView bookingMain(@RequestParam(value = "cPage", defaultValue = "1")int cPage,
									@RequestParam("advisId") String advisId,
									Model model) {
		System.out.println("===================================bookingMain=======================================");
		ModelAndView mav = new ModelAndView();
		final int numPerPage =5;
		Counselor counselor = counselorService.selectOne(advisId);
		
		Counselor c = new Counselor();

		c.setAdvisId(advisId);//test1
		//리뷰 리스트
		List<Review> list = counselorService.selectReviewList(c);
		
//		for(int i=0; i<list.size();i++) {
//			switch(list.get(i).getStarPoint()) {
//			case 1: //점일떄.
//				fourStar+= list.get(0).getStarPoint();
//			case 2:
//				fourStar+= list.get(0).getStarPoint();
//				
//			}
//			if(list.get(i).getStarPoint()==4) {
//			fourStar+= list.get(0).getStarPoint();
//			}
//		}
//		Map<String, Integer > starMap = HashMap<String,Integer>();
//		
//		int fourStarCnt =fourStar/4; 
//		
//		starMap.put("fourStar",fourStarCnt);
//		
//		
//		
//		
//		System.err.println(fourStarCnt);
////		Map가져가라 ?
//		//스타 포인트 가져오니까 여기서 처리하고 그걸 넘겨주면된다 .
		
		//모든상담사 리뷰 총 개수
		int totalReviewContents = counselorService.selectReviewTotalContents();
		
		//특정 상담사에 관한 리뷰 총 개수
		System.out.println("==========================reviewCountSelectOne==========================");
		int reviewCountSelectOne = counselorService.selectReviewCounselorOne(advisId);
		
		//특정상담사에 관한 리뷰중 특정평점을 받은 글의 총 개수
		List<reviewStar> list1 = new ArrayList<>();
		list1.add(new reviewStar(5, counselorService.countReview(advisId, 5)));
		list1.add(new reviewStar(4, counselorService.countReview(advisId, 4)));
		list1.add(new reviewStar(3, counselorService.countReview(advisId, 3)));
		list1.add(new reviewStar(2, counselorService.countReview(advisId, 2)));
		list1.add(new reviewStar(1, counselorService.countReview(advisId, 1)));
		
		
		Double reviewRating = counselorService.selectReviewRating(advisId);
		System.err.println("reviewRating=="+reviewRating);
		mav.addObject("reviewRating",reviewRating);
		mav.addObject("counselor",counselor);
		mav.addObject("list", list);
		mav.addObject("list1", list1);
		mav.addObject("totalReviewContents", totalReviewContents);
		mav.addObject("reviewCountSelectOne",reviewCountSelectOne);
		mav.setViewName("counselling/bookingMain");
		
		return mav;
	}
	
	@GetMapping("/bookingPage.do")
	public void bookingPage(@RequestParam("advisId") String advisId, Model model) {
		//상담사 정보
		Counselor counselor = counselorService.selectOne(advisId);

		model.addAttribute("counselor", counselor);
		
	}
	
}
