package kh.mclass.Igre.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.member.model.service.MemberService;
import kh.mclass.Igre.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes(value = {"memberLoggedIn"})
public class MemberController {
	@Autowired
	private MemberService ms;
	
//	@Autowired
//	private BCryptPasswordEncoder bcpe;
	
	@GetMapping("/login.do")
	public String login(@ModelAttribute("memberLoggedIn") Member m) {
		try {
			m.getMemberId().equals(null);
		} catch(NullPointerException e) {
			return "member/login";
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@PostMapping("/login.do")
	public String login(@RequestParam("memberId") String memberId,
					  @RequestParam("memberPwd") String memberPwd,
					  Model model, RedirectAttributes rda) {
		try {
			Member m = ms.selectId(memberId);
			
			if(m != null && m.getMemberPwd().equals(memberPwd)) {
				model.addAttribute("memberLoggedIn", m);
			} else {
				rda.addFlashAttribute("msg", "입력 정보가 올바르지 않습니다.");
				return "redirect:/member/login.do";
			}
		} catch(Exception e){
			rda.addFlashAttribute("msg", "로그인 도중 오류가 발생했습니다.");
			return "redirect:/member/login.do";
		}
		return "redirect:/";
	}
}












