package kh.mclass.Igre.counselling.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.common.Pagebar;
import kh.mclass.Igre.counselling.model.service.CounselorService;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.EditReview;
import kh.mclass.Igre.counselling.model.vo.BookingInfo;
import kh.mclass.Igre.counselling.model.vo.reviewStar;
import kh.mclass.Igre.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONArray;

@Controller
@Slf4j
@SessionAttributes(value= {"memberLoggedIn"})
@RequestMapping("/counselling")
public class CounsellingController {
	
	@Autowired
	CounselorService counselorService;
	
	@GetMapping("/counselorFind.do")
	public ModelAndView counselorFind(@RequestParam(value = "cPage", defaultValue = "1")int cPage,
										HttpServletRequest request, HttpServletResponse response) {
		
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
									Model model, HttpSession session, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		final int numPerPage =5;
		
		Member member = (Member) session.getAttribute("memberLoggedIn");
		mav.addObject("member",member);
		
		Counselor counselor = counselorService.selectOne(advisId);
		
		Counselor c = new Counselor();

		c.setAdvisId(advisId);//test1
		
		//모든상담사 리뷰 총 개수
		int totalReviewContents = counselorService.selectReviewTotalContents();
		
		//상담사 1명의 리뷰 게시글 count
		int reviewCountSelectOne = counselorService.selectReviewCounselorOne(advisId);
		
		//리뷰 리스트
		List<Map<String,String>> list = counselorService.selectReviewList(c, cPage, numPerPage);
		mav.addObject("pageBar",Pagebar.getPageBar(reviewCountSelectOne, cPage, numPerPage,"/Igre/counselling/bookingMain.do?advisId="+advisId));
		
		//1점부터 5점까지 준 사람들을 Arraylist로 저장
		List<reviewStar> list1 = new ArrayList<>();
		list1.add(new reviewStar(5, counselorService.countReview(advisId, 5)));
		list1.add(new reviewStar(4, counselorService.countReview(advisId, 4)));
		list1.add(new reviewStar(3, counselorService.countReview(advisId, 3)));
		list1.add(new reviewStar(2, counselorService.countReview(advisId, 2)));
		list1.add(new reviewStar(1, counselorService.countReview(advisId, 1)));
						
		//상담사 한명의 리뷰 평점 평균
		Double reviewRating = counselorService.selectReviewRating(advisId);

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
	public ModelAndView bookingPage(@RequestParam("advisId") String advisId, HttpSession session,HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		//로그인 회원 정보 가져오기
		Member member = (Member) session.getAttribute("memberLoggedIn");
		
		//최근 결제 내역 확인 (1일 경우 중복 불가! 0일 경우 중복 X 구매가능!)
		int result = counselorService.recentSelectOne(member.getMemberId());
		
		if(result == 1) {
			String referer = request.getHeader("referer");
			session.setAttribute("referer", referer);
			session.setAttribute("msg", "이미 진행 중인 상담 상품이 존재 합니다.");
			log.debug("referer = " + referer);
			mav.setViewName("redirect:/");		
		}
		
		
		//상담사 정보
		Counselor counselor = counselorService.selectOne(advisId);
		Member m = new Member();
		mav.addObject("counselor", counselor);	
		
		return mav;
	}
	
	@PostMapping(value = "/bookingEnd.do")
	public String bookingInsert(@ModelAttribute BookingInfo info, Model model, @RequestParam(value="payMethod")String payMethod, RedirectAttributes redirectAttributes ) {
		
		log.debug("예약상태"+info);
		
		String payInfo="";
		switch(payMethod) {
		case "cr": payInfo="신용카드";
			break;
		case "ra": payInfo="계좌이체";
			break;
		case "ph": payInfo="휴대폰";
			break;
		case "na": payInfo="네이버페이";
			break;
		case "ka": payInfo="카카오페이";
			break;
		case "to": payInfo="토스";
			break;
		}
		info.setPayInfo(payInfo);
		
		BookingInfo resultInfo =  counselorService.bookingInsert(info);
		
		log.debug(resultInfo+"예약정보");
		
		String msg = resultInfo!=null?"예약성공":"예약실패";
		model.addAttribute("msg",msg);
		
		String today = String.valueOf(resultInfo.getStartDay());
		
		
		model.addAttribute("info", info);
		model.addAttribute("today", today);
		
		return "counselling/bookingEnd";
	}
	
	
	@GetMapping("/filter.do")
	@ResponseBody
	public List<Counselor> filter(@RequestParam(value = "category-check" ,defaultValue = "") String[] category, @RequestParam(value = "type-level",defaultValue = "") String[] level,
									@RequestParam("gender-check") String[] gender, @RequestParam("day-check") String[] day){
		
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
		return list;
	}
	
	//리뷰 수정
		@PostMapping("/editReview")
		public String editReview(EditReview edit, RedirectAttributes redirect) {
			
			log.debug(edit+"수정 리뷰");
			
			int result = counselorService.editReview(edit);
			

			return "redirect:/counselling/bookingMain.do?advisId="+edit.getAdvisId();
		}
		
		//리뷰 삭제
		@GetMapping("/deleteReview.do")
		public String deleteReview(@RequestParam(value="advisReviewNo") int num, @RequestParam(value="advisId") String id, RedirectAttributes redirect) {
			
			int result = counselorService.deleteReview(num);
			
			return "redirect:/counselling/bookingMain.do?advisId="+id;
		}
		
	
}