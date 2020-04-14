package kh.mclass.Igre.counselorAdmin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.admin.model.exception.AdminException;
import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.counselorAdmin.model.service.CounselorAdminService;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/counselorAdmin")
@Slf4j
@SessionAttributes(value= {"adminLoggedIn"})

public class CounselorAdminController {
	
	@Autowired
	CounselorAdminService cadminService;
	
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
		if(admin != null && adminPwd.equals(admin.getAdminPwd())) {
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

	
}
