package kh.mclass.Igre.counselling.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.common.Pagebar;
import kh.mclass.Igre.counselling.model.service.CounselorService;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.counselling.model.vo.reviewStar;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

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
		
		final int numPerPage =10;
		
		List<Counselor> list = counselorService.selectCounselorList(cPage, numPerPage);
		List<String> keywordList = new ArrayList<>();
		for(int i = 0; i<list.size(); i++) {
			String keyword = "";
			for(int j = 0; j<list.get(i).getAdvisKeyword().length; j++) {
				keyword += list.get(i).getAdvisKeyword()[j];
				keyword += " ";
			}
			keywordList.add(keyword);
		}
		
		//총 리뷰 가져오기
		for(int i=0; i< list.size(); i++) {
			list.get(i).setReviewTotal(counselorService.selectReviewTotal(list.get(i).getAdvisId())); 			
		}
		
		
		//별점 가져오기
		for(int i=0; i< list.size(); i++) {
			list.get(i).setStarPoint(counselorService.selectStarPoint(list.get(i).getAdvisId())); 			
		}
		
		int totalContents = counselorService.selectCounselorTotalContents();
		
		System.out.println(list);
		
		
		JSONArray jsonArray = new JSONArray();
	
		mav.addObject("list", jsonArray.fromObject(list));
		mav.addObject("keywordList", keywordList);
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
		
		//모든상담사 리뷰 총 개수
		int totalReviewContents = counselorService.selectReviewTotalContents();
		
		//상담사 1명의 리뷰 게시글 count
		System.out.println("==========================reviewCountSelectOne==========================");
		int reviewCountSelectOne = counselorService.selectReviewCounselorOne(advisId);
		
		//리뷰 리스트
		List<Map<String,String>> list = counselorService.selectReviewList(c, cPage, numPerPage);
		mav.addObject("pageBar",Pagebar.getPageBar(reviewCountSelectOne, cPage, numPerPage,"/Igre/counselling/bookingMain.do?advisId="+advisId));
		
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
	
	@GetMapping("/filter.do")
	@ResponseBody
	public List<Counselor> filter(@RequestParam(value = "category-check" ,defaultValue = "") String[] category, @RequestParam(value = "type-level",defaultValue = "") String[] level,
									@RequestParam("gender-check") String[] gender, @RequestParam("day-check") String[] day){
		System.out.println(category);
		System.out.println(gender);
		System.out.println(level);
		System.out.println(day);
		
		Map<String,String[]> param = new HashMap<>();
		param.put("category", category);
		param.put("level", level);
		param.put("gender", gender);
		param.put("day", day);
		
		List<Counselor> list = counselorService.selectFilter(param);
		
		//총 리뷰 가져오기
		for(int i=0; i< list.size(); i++) {
			list.get(i).setReviewTotal(counselorService.selectReviewTotal(list.get(i).getAdvisId())); 			
		}
		
		
		//별점 가져오기
		for(int i=0; i< list.size(); i++) {
			list.get(i).setStarPoint(counselorService.selectStarPoint(list.get(i).getAdvisId())); 			
		}
		log.debug(list.toString());
		return list;
	}
	
	
}