package kh.mclass.Igre.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
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
	
	@GetMapping("/login.do")
	public String login(HttpSession session) {
		try {
			Member m = (Member)session.getAttribute("memberLoggedIn");
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
			log.error(""+m);
			
			if(m != null && m.getMemberPwd().equals(memberPwd)) {
				HashMap<String, ArrayList<Integer>> preferList = ms.preferList(memberId);
				m.setPrefList(preferList);
				model.addAttribute("memberLoggedIn", m);
			} else {
				rda.addFlashAttribute("msg", "입력 정보가 올바르지 않습니다.");
				return "redirect:/member/login.do";
			}
		} catch(Exception e){
			rda.addFlashAttribute("msg", "로그인 도중 오류가 발생했습니다.");
			e.printStackTrace();
			return "redirect:/member/login.do";
		}
		return "redirect:/";
	}
	
	@GetMapping("/logout.do")
	public String logout(SessionStatus ss) {
		if(!ss.isComplete())
			ss.setComplete();
		return "redirect:/";
	}
	
	//--------------------상욱--------------------

	@GetMapping("/passwordChoiceView.do")
	public ModelAndView passwordChoiceView(ModelAndView mav) {
		
		mav.setViewName("member/passwordChoiceView");
		
		return mav;
	}
	@GetMapping("/enrollChoiceView.do")
	public ModelAndView enrollChoiceView(ModelAndView mav) {
		
		mav.setViewName("member/enrollChoiceView");
		
		return mav;
	}
	@GetMapping("/memberEnroll.do")
	public ModelAndView memberEnroll(ModelAndView mav) {
		
		mav.setViewName("member/memberEnroll");
		
		return mav;
	}
	
	@PostMapping("/memberEnroll.do")
	public String memberEnrollP(Member member, RedirectAttributes ras, String addr1, String addr2, String addr3) {

		
		String address = addr1+addr2+addr3;
		member.setAddress(address);
		int result = ms.enroll(member);
		String msg = result>0?"회원가입 완료!" : "누락된 항목이 있습니다";
		ras.addFlashAttribute("msg",msg);
		
		return "redirect:/";
		
		
		
	}
	
	
	@GetMapping("/{memberId}/checkId.do")
	@ResponseBody
	public Map<String,Object> checkId(@PathVariable("memberId") String memberId,Model model){
		
		Map<String,Object> map = new HashMap<>();
		boolean isUsable = ms.selectOne(memberId)==null?true:false; 
		
		map.put("isUsable",isUsable);
		
		return map;
	}
}












