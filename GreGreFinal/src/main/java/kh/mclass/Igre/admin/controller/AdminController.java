package kh.mclass.Igre.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.admin.model.exception.AdminException;
import kh.mclass.Igre.admin.model.service.AdminService;
import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;
import kh.mclass.Igre.admin.model.vo.Report;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
@SessionAttributes(value = {"adminLoggedIn"})
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	//Admin 로그인 폼 불러오기
	@GetMapping("/login.do")
	public String admin() {
		log.debug("[/admin/login.do]가 요청되었습니다.");
		
		return "admin/adminLogin";
	}
	
	//Admin 인덱스 불러오기
	@GetMapping("/index.do")
	public String index() {
		
		return "admin/adminIndex";
	}
	
	//Admin 계정으로 로그인 했을 때, 인덱스 불러오기
	@PostMapping("/index.do")
	public String login(@RequestParam("adminId") String adminId,
						@RequestParam("adminPwd") String adminPwd,
						Model model,
						RedirectAttributes redirectAttributes) {
		
	try {
		//로그인 처리
		//1. adminId로 admin 객체조회
		Admin admin = adminService.selectOne(adminId);
//		log.debug("admin={}"+admin);
		
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
	
	
	//Admin 회원목록 불러오기
	@GetMapping("/memberList.do")
	public String list(Model model) {
		
		List<Amember> list = adminService.list();
		
		model.addAttribute("list", list);
		
		return "admin/memberList";
	}
	
	//Admin 회원목록에서 수정버튼 클릭시 수정 폼 불러오기
	@GetMapping("/memberUpdate.do")
	public String update(Model model,
						 @RequestParam("memberId") String memberId) {
		
		Amember amember = adminService.MemberSelectOne(memberId);
		
		model.addAttribute("amember", amember);
		
		return "admin/memberUpdate";
	}
	
	//Admin 회원정보 수정하기
	@PostMapping("/memberUpdate.do")
	public String update(Amember amember, 
						 RedirectAttributes redirectAttributes) {
		
		int result = adminService.updateMember(amember);
		
		redirectAttributes.addFlashAttribute("msg", result>0?"회원정보 수정이 완료되었습니다.":"회원정보 수정에 실패하였습니다.");
		
		return "redirect:/admin/memberList.do";
		
	}
	
	//Admin 관리자 정보 수정 폼으로 가기
	@GetMapping("/adminUpdate.do")
	public String adminUpdate() {
		
		return "admin/adminUpdate";
	}
		
	
	//Admin 관리자 정보 수정하기
	@PostMapping("/adminUpdate.do")
	public String adminUpdate(Amember amember,
							  RedirectAttributes redirectAttributes) {
		
		int result = adminService.updateAdmin(amember);
		
		redirectAttributes.addFlashAttribute("msg", result>0?"정보수정이 완료되었습니다.":"정보수정에 실패하였습니다.");
		
		return "redirect:/admin/index.do";
	}
	
	//Admin 회원 탈퇴하기
	@GetMapping("/memberDelete.do")
	public String delete(Model model,
						 @RequestParam("memberId") String memberId,
						 RedirectAttributes redirectAttributes) {
		
		int result = adminService.delete(memberId);
		
		redirectAttributes.addFlashAttribute("msg", result>0?"회원탈퇴가 완료되었습니다.":"회원탈퇴에 실패하였습니다.");
		
		return "redirect:/admin/memberDeleteList.do";
	}
	
	@GetMapping("/logout.do")
	public String logout(SessionStatus sessionStatus,
						 @ModelAttribute("adminLoggedIn") Admin admin) {
							
		log.debug("["+admin.getAdminId()+"]이 로그아웃 했습니다.");
		
		if(!sessionStatus.isComplete())
			sessionStatus.setComplete();
		
		return "redirect:/admin/login.do";
	}
	
	@GetMapping("/memberDeleteList.do")
	public String deleteList(Model model,
							 RedirectAttributes redirectAttributes) {
		
		List<Amember> list = adminService.deleteList();
		
		model.addAttribute("list", list);
								
		return "admin/memberDeleteList";
	}
	
	@GetMapping("/report.do")
	public String report(Model model) {
		
		List<Report> list = adminService.report();
		
		model.addAttribute("list", list);
		
		return "admin/report";
	}
	
	@ResponseBody
	@PostMapping("/postDelete.do")
	public Map<String,Object> postDelete(Model model,
							   @RequestParam(value = "arr1[]") List<String> bcArr,
							   @RequestParam(value = "arr2[]") List<Integer> pnArr) {
		
		/* log.debug("pnArr={}",pnArr); */
		
		int result = 0; 
		
		for(int i=0; i<pnArr.size(); i++) {
			
			result += adminService.postDelete(bcArr.get(i), pnArr.get(i));
			result += adminService.reportUpdate(bcArr.get(i), pnArr.get(i));
		}
		
		 Map<String,Object> map = new HashMap<>();
		 map.put("result", result);
		 
		return map;
		
	}
	
	@ResponseBody
	@PostMapping("/replyDelete.do")
	public Map<String,Object> replyDelete(Model model,
										  @RequestParam(value = "rearr1[]") List<String> rebcArr,
										  @RequestParam(value = "rearr2[]") List<Integer> repnArr,
										  @RequestParam(value = "rearr3[]") List<Integer> renArr) {
		int result = 0;
		
		log.debug("reArr={}", renArr);
		
		for(int i=0; i<renArr.size(); i++) {
			
			result += adminService.replyDelete(rebcArr.get(i), renArr.get(i));
			result += adminService.replyUpdate(rebcArr.get(i), repnArr.get(i), renArr.get(i));
		}
		
		Map<String,Object> map = new HashMap<>();
		map.put("result", result);
		
		return map;
		
	}
	
	@GetMapping("/board.do")
	public String board() {
		
		return "admin/board";
	}

}










