 package kh.mclass.Igre.mypage.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.emory.mathcs.backport.java.util.Arrays;
import kh.mclass.Igre.counselling.model.vo.BookingInfo;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.service.MyPageService;
import kh.mclass.Igre.mypage.model.vo.Child;
import kh.mclass.Igre.mypage.model.vo.Vaccination;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/myPage")
@SessionAttributes(value= {"memberLoggedIn"})
public class MyPageController {

	@Autowired
	private MyPageService mps;
	
	@GetMapping("/myPageMain")
	public ModelAndView mypageview(ModelAndView mav,HttpSession session) {
			
			Member m = (Member) session.getAttribute("memberLoggedIn");
			mav.addObject("m",m);
			mav.setViewName("myPage/myPageMain");

		return mav;
	}
	
	@GetMapping("/deleteMember")
	public ModelAndView deleteMember(ModelAndView mav,HttpSession session) {
			
			Member m = (Member) session.getAttribute("memberLoggedIn");
			mav.addObject("m",m);
			mav.setViewName("myPage/deleteMember");

		return mav;
	}
	@GetMapping("vaccinAdd")
	public ModelAndView vaccinAdd(Child child,ModelAndView mav,HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
//		mav childSelect = mps.childSelect(child);
//		mav.addObject("childSelect",childSelect);
		mav.addObject("m",m);
		mav.setViewName("myPage/vaccinAdd");
		
		return mav;
	}
	
//	@GetMapping("memberChildUpdate")
//	public ModelAndView mypagechildview(ModelAndView mav,HttpSession session) {
//		
//		Member m = (Member) session.getAttribute("memberLoggedIn");
//		mav.addObject("m",m);
//		mav.setViewName("myPage/memberChildUpdate");
//
//	return mav;
//}
	
	@GetMapping("/memberUpdate.do")
	public ModelAndView memberUpdate(ModelAndView mav,HttpSession session) {

		Member m = (Member) session.getAttribute("memberLoggedIn");
		mav.addObject("m",m);
		mav.setViewName("myPage/memberUpdate");

		return mav;
	}
	
	@PostMapping("updateMember.do")
	public String updateMember(SessionStatus ss,HttpSession session,Member member,RedirectAttributes rda,String addr1,String addr2,String addr3) {
		String address = addr1 +"+"+ addr2 +"+"+ addr3;
		member.setAddress(address);
		int result = mps.updateMember(member);
		ss.setComplete();
		String msg = result > 0 ? "수정 완료 다시 로그인 하세요" : "누락된 항목이 있습니다";
		rda.addFlashAttribute("msg", msg);

		return "redirect:/member/login.do";
	}
	
	@PostMapping("updatePassword")
	public String updatePassword(SessionStatus ss,HttpSession session,Member member,RedirectAttributes rda) {
		int result = mps.updatePassword(member);
		ss.setComplete();
		String msg = result > 0 ? "수정 완료 다시 로그인 하세요" : "누락된 항목이 있습니다";
		rda.addFlashAttribute("msg", msg);

		return "redirect:/member/login.do";
	}
	
	@PostMapping("/memberChildUpdate.do")
	public String memberChildUpdate(String[] vaccinCode,Date[] vaccinDate,Integer[] nth,Vaccination vaccination ,Member member,Child child,RedirectAttributes ras,String parentsId,String childName) {
		String childId = parentsId+"_"+childName;
		child.setChildId(childId);
	
		System.out.println("배열로"+Arrays.toString(vaccinCode));
		System.out.println("객체로"+vaccination);
//		for(int i=0; i<vaccinCode.length; i++) {
//			
//		}
		
		int result = mps.enroll(child,member,vaccination,vaccinCode,vaccinDate,nth);
		String msg = result > 0 ? "자녀추가 완료!" : "누락된 항목이 있습니다";
		ras.addFlashAttribute("msg", msg);
		
		return "redirect:/myPage/memberChildUpdate.do";
	}
	
	@GetMapping("/memberChildUpdate.do")
	public ModelAndView selectChild(ModelAndView mav , Child child,HttpSession session,Vaccination vaccination) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		String parentsId = m.getMemberId();
		child.setParentsId(parentsId);
		vaccination.setParentsId(parentsId);
		List<Child> list = mps.selectChild(child);
		List<Vaccination> list2 = mps.selectVaccination(vaccination);
		

//		Map<String,List<String>> maplist = new HashMap<String, List<String>>();
//		maplist.put("list",list);
//		maplist.put("list2",list2);
//		Map<Child,Map<Child,List<Vaccination>>> map = mps.selectVaccin(maplist);		
//		mav.addObject("m",m);
		mav.addObject("list",list);
		mav.addObject("list2",list2);
		mav.setViewName("myPage/memberChildUpdate");
		return mav;
	}
	@PostMapping("memberDelete.do")
	public String memberDelete(SessionStatus ss,HttpSession session,Member member,RedirectAttributes rda) {
		int result = mps.memberDelete(member);
		ss.setComplete();
		String msg = result > 0 ? "탈퇴 완료" : "아 오류다~";
		rda.addFlashAttribute("msg", msg);

		return "redirect:/";
	}
	
	@GetMapping("/counsellingInfo.do")
	public ModelAndView selectCounsellingInfo(@RequestParam(value = "cPage", defaultValue = "1")int cPage,  ModelAndView mav, BookingInfo book, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		final int numPerPage =5;
		
		Member m = (Member)session.getAttribute("memberLoggedIn");
		book.setMemberId(m.getMemberId());
		//예약정보 불러오기
		List<BookingInfo> list = mps.selectBookingInfoList(book);
		
		mav.addObject("m",m);
		mav.addObject("list",list);
		return mav;
	}
	
//	리뷰 작성
	@PostMapping("/counsellingInfo.do")
	public String reviewWrite(Review review, RedirectAttributes redirectAttributes) {
		
		int result = mps.reviewWrite(review);
		
		return "redirect:/myPage/counsellingInfo.do";
	}
	
	@PostMapping("findPassword.do")
	public String findPassword(Member member,RedirectAttributes redirectAttributes) {
		Member selectMember = mps.findPassword(member);
		int result = mps.fupdatePassword(member);
		String msg = selectMember!=null?"초기비밀번호 0000 으로 초기화 되었습니다":"입력정보가 일치하지 않습니다";
		redirectAttributes.addFlashAttribute("msg", msg);

		return "redirect:/member/login.do";
	}
	
	
	
}
