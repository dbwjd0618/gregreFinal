package kh.mclass.Igre.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
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
	
//	@GetMapping("/login.do")
//	public String login(@ModelAttribute("memberLoggedIn") Member m) {
//		try {
//			m.getMemberId().equals(null);
//		} catch(NullPointerException e) {
//			return "member/login";
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/";
//	}
//	
//	@PostMapping("/login.do")
//	public String login(@RequestParam("memberId") String memberId,
//					  @RequestParam("memberPwd") String memberPwd,
//					  Model model, RedirectAttributes rda) {
//		try {
//			Member m = ms.selectId(memberId);
//			
//			if(m != null && m.getMemberPwd().equals(memberPwd)) {
//				model.addAttribute("memberLoggedIn", m);
//			} else {
//				rda.addFlashAttribute("msg", "입력 정보가 올바르지 않습니다.");
//				return "redirect:/member/login.do";
//			}
//		} catch(Exception e){
//			rda.addFlashAttribute("msg", "로그인 도중 오류가 발생했습니다.");
//			return "redirect:/member/login.do";
//		}
//		return "redirect:/";
//	}
	
	//--------------------상욱--------------------
	@GetMapping("/login/login.do")
	public ModelAndView login(ModelAndView mav) {
		
		mav.setViewName("login/login");
		
		return mav;
	}
	@GetMapping("/login/passwordChoiceView.do")
	public ModelAndView passwordChoiceView(ModelAndView mav) {
		
		mav.setViewName("login/passwordChoiceView");
		
		return mav;
	}
	@GetMapping("/login/enrollChoiceView.do")
	public ModelAndView enrollChoiceView(ModelAndView mav) {
		
		mav.setViewName("login/enrollChoiceView");
		
		return mav;
	}
	@GetMapping("/login/memberEnroll.do")
	public ModelAndView memberEnroll(ModelAndView mav) {
		
		mav.setViewName("/login/memberEnroll");
		
		return mav;
	}
	
	@PostMapping("/login/memberEnroll.do")
	public String memberEnrollP(Member member, RedirectAttributes ras) {

		int result = ms.enroll(member);
		
		String msg = result>0?"회원가입 완료!" : "누락된 항목이 있습니다";
		ras.addFlashAttribute("msg",msg);
		
		return "redirect:/";
		
		
		
	}
	
	
	@GetMapping("login/{memberId}/checkId.do")
	public Map<String,Object> checkId(@PathVariable("memberId") String memberId,Model model){
		
		Map<String,Object> map = new HashMap<>();
		boolean isUsable = ms.selectOne(memberId)==null?true:false; 
		
		map.put("isUsable",isUsable);
		
		return map;
	}
}












