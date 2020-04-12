package kh.mclass.Igre.adminchat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.adminchat.model.service.AdminChatService;
import kh.mclass.Igre.adminchat.model.vo.AdminMSG;
import kh.mclass.Igre.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminStompController {

	@Autowired
	AdminChatService adminChatService;

	@ModelAttribute
	public void common(Model model, HttpSession session,
			@SessionAttribute(value = "adminLoggedIn", required = false) Admin adminLoggedIn,
			@SessionAttribute(value = "memberLoggedIn", required = false) Member memberLoggedIn) {
		String adminId = adminLoggedIn.getAdminId();
		String memberId = memberLoggedIn.getMemberId();

		model.addAttribute("adminId", adminId);
		model.addAttribute("memberId", memberId);
		
		log.debug("adminId 속성값 설정됨 [{}]", adminId);
	}

	@GetMapping("/chat/list.do")
	public String chat(Model model, @ModelAttribute("adminId") String adminId) {
		// 최근 사용자 채팅메세지 목록
		List<Map<String, String>> recentList = adminChatService.findRecentList(adminId);
		log.debug("recentList={}", recentList);

		model.addAttribute("recentList", recentList);

		return "admin/adminChatList";
	}

	@GetMapping("/chat/{chatId}")
	public String chat(@PathVariable("chatId") String chatId, Model model) {

		List<Map<String, Object>> chatList = adminChatService.findChatListMapByChatId(chatId);
		model.addAttribute("chatList", chatList);

		log.debug("chatList={}", chatList);

		return "admin/adminChat";

	}

	// 주석처리 후 TestController 실행
	@MessageMapping("/admin/chat/{chatId}")
	@SendTo(value = { "/admin/chat/{chatId}", "/admin/chat/push" })
	public AdminMSG sendEcho(AdminMSG fromMessage, @DestinationVariable String chatId) {
		log.debug("fromMessage={}", fromMessage);
//		log.debug("chatId={}", chatId);

		adminChatService.insertChatLog(fromMessage);
		
		return fromMessage;
	}

	@MessageMapping("/lastCheck")
	@SendTo(value={"/admin/chat/push"})
	public AdminMSG lastCheck(@RequestBody AdminMSG fromMessage){
		log.debug("lastCheck={}",fromMessage);
		
		//db에 채팅방별 사용자 최종확인 시각을 갱신한다.
		adminChatService.updateLastCheck(fromMessage);
		
		return fromMessage; 
	}

}
