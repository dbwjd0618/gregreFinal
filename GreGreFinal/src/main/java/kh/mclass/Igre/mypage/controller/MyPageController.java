package kh.mclass.Igre.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.service.MyPageService;
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
	
	@GetMapping("/memberUpdate.do")
	public ModelAndView memberUpdate(ModelAndView mav,HttpSession session) {

		Member m = (Member) session.getAttribute("memberLoggedIn");
		mav.addObject("m",m);
		mav.setViewName("myPage/memberUpdate");

		return mav;
	}
	@PostMapping("updateMember.do")
	public String updateMember(SessionStatus ss,HttpSession session,Member member,RedirectAttributes rda,String addr1,String addr2,String addr3) {
		String address = addr1 +","+ addr2 +","+ addr3;
		member.setAddress(address);
		int result = mps.updateMember(member);
		ss.setComplete();
		String msg = result > 0 ? "수정 완료 다시 로그인 하세요" : "누락된 항목이 있습니다";
		rda.addFlashAttribute("msg", msg);

		return "redirect:/member/login.do";
	}
	
}
