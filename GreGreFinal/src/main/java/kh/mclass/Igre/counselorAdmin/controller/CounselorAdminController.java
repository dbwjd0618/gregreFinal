package kh.mclass.Igre.counselorAdmin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.admin.model.exception.AdminException;
import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselorAdmin.model.service.CounselorAdminService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/counselorAdmin")
@Slf4j
@SessionAttributes(value= {"adminLoggedIn"})

public class CounselorAdminController {
	
	@Autowired
	CounselorAdminService cadminService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("/login.do")
	public String counselorAdmin() {
		
		return "counselorAdmin/counselorAdminLogin";
	}
	
	@GetMapping("/index.do")
	public String index(Model model) {
		
		List<Counselor> list = cadminService.list();
		
		model.addAttribute("list", list);
		
		return "counselorAdmin/counselorAdminIndex";
		
	}
	
	@PostMapping("/login.do")
	public String login(@RequestParam("adminId") String adminId,
						@RequestParam("adminPwd") String adminPwd,
						Model model,
						RedirectAttributes redirectAttributes) {
					
	try {
		
		//1. adminId로 admin 객체 조회
		Admin admin = cadminService.selectOne(adminId);
		log.debug("admin={}"+admin);
		
		//2. 사용자가 입력한 password와 저장된 password 비교해서 로그인처리
		if(admin != null && bcryptPasswordEncoder.matches(adminPwd, admin.getAdminPwd())) {
			//로그인 성공
			model.addAttribute("adminLoggedIn", admin);
			
			return "redirect:/counselorAdmin/index.do";
					
		}
		
		else {
			String msg = "입력하신 아이디 혹은 비밀번호가 일치하지 않습니다.";
			
			redirectAttributes.addFlashAttribute("msg", msg);
		}
	}
		
	catch(Exception e) {
		log.error("로그인 처리 예외", e);
		
		throw new AdminException("로그인 처리 도중 오류가 발생하였습니다.", e);
	}
		return "redirect:/counselorAdmin/login.do";
		
	}
	
	@GetMapping("/logout.do")
	public String logout(SessionStatus sessionStatus,
						 @ModelAttribute("adminLoggedIn") Admin admin,
						 HttpSession session) {
		
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		session.invalidate();
							
		return "redirect:/counselorAdmin/login.do";
	}
	
	@GetMapping("/counselorView.do")
	public String counselorView(Model model,
								@RequestParam("advisId") String advisId) {
		
		Counselor counselor = cadminService.counselorView(advisId);
		model.addAttribute("counselor", counselor);
		log.debug("counselor={}", counselor);
		
		return "counselorAdmin/counselorAthorityUpdate";
	}

	@PostMapping("/athorityUpdate.do")
	public String athorityUpdate(Counselor counselor) {
		
		int result =cadminService.athorityUpdate(counselor);
		
		return "redirect:/counselorAdmin/index.do";
		
	}
	
	@GetMapping("/counselorDelete.do")
	public String delete(Model model,
				 @RequestParam("advisId") String advisId,
				 RedirectAttributes redirectAttributes) {
	
	int result = cadminService.counselorDelete(advisId);
	
	redirectAttributes.addFlashAttribute("msg", result>0?"회원탈퇴가 완료되었습니다.":"회원탈퇴에 실패하였습니다.");
	
	return "redirect:/counselorAdmin/index.do";
	}
	
	@GetMapping("/counselorUpdate.do")
	public String counselorUpdate(Model model,
								  @RequestParam("advisId") String advisId) {

		Counselor counselor = cadminService.counselorSelectOne(advisId);
		model.addAttribute("counselor", counselor);
		
		List<Counselor> list = cadminService.list();
		model.addAttribute("list", list);
		
		return "counselorAdmin/counselorUpdate";
		
	}
	
	
	@PostMapping("/counselorUpdate.do")
	public String counselorUpdate(Counselor counselor,
								  RedirectAttributes redirectAttributes) {
		
		int result = cadminService.counselorUpdate(counselor);
		
		redirectAttributes.addFlashAttribute("msg", result>0?"상담사정보 수정이 완료되었습니다.":"상담사 정보 수정에 실패하였습니다.");
									
		return "redirect:/counselorAdmin/index.do";
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
