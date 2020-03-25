package kh.mclass.Igre.admin.controller;

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
import kh.mclass.Igre.admin.model.service.AdminService;
import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
@SessionAttributes(value = {"adminLoggedIn"})
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/login.do")
	public String admin() {
		log.debug("[/admin/login.do]가 요청되었습니다.");
		
		return "admin/adminLogin";
	}
	
	@GetMapping("/index.do")
	public String index() {
		
		return "admin/adminIndex";
	}
	
	@PostMapping("/index.do")
	public String login(@RequestParam("adminId") String adminId,
						@RequestParam("adminPwd") String adminPwd,
						Model model,
						RedirectAttributes redirectAttributes) {
		
	try {
		//로그인 처리
		//1. adminId로 admin 객체조회
		Admin admin = adminService.selectOne(adminId);
		log.debug("admin={}"+admin);
		
		//2.사용자가 입력한 password와 저장된 password 비교해서 로그인처리
		if(admin != null && adminPwd.equals(admin.getAdminPwd())) {
			//로그인성공
			model.addAttribute("adminLoggedIn", admin);
			
			return "admin/adminIndex";
		}
		
		else {
			//로그인실패
			String msg = "입력하신 아이디 혹은 비밀번호가 일치하지 않습니다.";

			redirectAttributes.addFlashAttribute("msg", msg);
			log.debug(msg);
		}
	}
	
	catch(Exception e) {
		log.error("로그인 처리 예외", e);
		
		throw new AdminException("로그인 처리 도중 오류가 발생하였습니다.", e);
	}
		
		return "redirect:/admin/login.do";
	}
	
	@GetMapping("/memberList.do")
	public String list(Model model) {
		
		List<Amember> list = adminService.list();
		
		log.debug("list={}", list);
		model.addAttribute("list", list);
		
		return "admin/memberList";
	}
	
	
	@GetMapping("/memberUpdate.do")
	public String update() {
		
		return "admin/memberUpdate";
	}
	
	@PostMapping("/memberUpdate.do")
	public String update(Amember amember, 
						 RedirectAttributes redirectAttributes) {
		
//		int result = adminService.updateMember();
		
		return "admin/memberList";
		
	}
	
	
	
	
	
	
	
	
	
	
	

}
