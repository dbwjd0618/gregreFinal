package kh.mclass.Igre.adminchat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.adminchat.model.service.AdminChatService;
import kh.mclass.Igre.adminchat.model.vo.AdminMSG;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/admin")
@Controller
@Slf4j
public class AdminStompController {

	@Autowired
	AdminChatService adminChatService;
	
	@ModelAttribute
	public void common(Model model,
					   HttpSession session,
					   @SessionAttribute(value="adminLoggedIn", required=false) Admin adminLoggedIn) {
		String adminId = adminLoggedIn.getAdminId();

		model.addAttribute("adminId", adminId);
		log.debug("adminId 속성값 설정됨 [{}]", adminId);
	}
	
	@GetMapping("/chat/list.do")
	public String chatList(Model model,
					   @ModelAttribute("adminId") String adminId) {
		//최근 사용자 채팅메세지 목록
		List<Map<String, String>> recentList = adminChatService.findRecentList(adminId);
		log.debug("recentList={}", recentList);
		
		model.addAttribute("recentList", recentList);
		
		return "admin/adminChatList";
	}
	
	@GetMapping("/chat/{chatId}")
	public String chat(@PathVariable("chatId") String chatId, Model model) {
		
		log.debug("[{}]",chatId);
		List<AdminMSG> chatList = adminChatService.findChatListByChatId(chatId);
		model.addAttribute("chatList", chatList);
		
		log.debug("chatList={}",chatList);
		
		return "admin/adminChat";
	}
	
	/*
	 * @GetMapping("/chat/{chatId}") public String chat(@PathVariable("chatId")
	 * String chatId, Model model) {
	 * 
	 * log.debug("[{}]",chatId); List<Map<String,Object>> chatList =
	 * adminChatService.findChatListMapByChatId(chatId);
	 * model.addAttribute("chatList", chatList);
	 * 
	 * log.debug("chatList={}",chatList);
	 * 
	 * return "admin/adminChat"; }
	 */
	
}
