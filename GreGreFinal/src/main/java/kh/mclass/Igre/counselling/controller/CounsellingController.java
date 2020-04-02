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

import kh.mclass.Igre.counselling.model.service.CounselorService;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;
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
			/* @RequestParam("reviewerId") String reviewerId, */
									Model model) {
			
		ModelAndView mav = new ModelAndView();
		final int numPerPage =5;
		
		Counselor counselor = counselorService.selectOne(advisId);
		
		Counselor c = new Counselor();
		
				c.setAdvisId(advisId);//test1
			
		//리뷰 리스트
		List<Review> list = counselorService.selectReviewList(c);
		
		int totalReviewContents = counselorService.selectReviewTotalContents();
		mav.addObject("counselor",counselor);
		mav.addObject("list", list);
		mav.addObject("totalReviewContents", totalReviewContents);
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
		log.debug(list.toString());
		return list;
	}
	
	
}
