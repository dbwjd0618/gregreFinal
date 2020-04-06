package kh.mclass.Igre.counselor.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kh.mclass.Igre.chat.model.service.ChatService;
import kh.mclass.Igre.chat.model.vo.Msg;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/counselor")
public class CounselorController {
	
	@Autowired
	ChatService chatService;
	
	/**
	 * 관리자 유효성 검사 포함
	 * 
	 * @param model
	 * @param session
	 * @param memberLoggedIn
	 */
	@ModelAttribute
	public void common(Model model, 
					   HttpSession session, 
					   @SessionAttribute(value="counselorLoggedIn", required=false) Counselor counselorLoggedIn) {
		//로그인하지 않은 경우, IllegalStateException 예외 던짐.
		String counselorId = Optional.ofNullable(counselorLoggedIn)//memberLoggedIn은 nullable하다. 로그인 하지 않은 경우 null
														  .map(Counselor::getAdvisId).orElseThrow(()-> new IllegalStateException("관리자만 이용할 수 있습니다."));
		
		model.addAttribute("counselorId", counselorId);
		log.debug("counselorId 속성값 설정되었음. [{}]",counselorId);
	}
	
	
	
	@GetMapping("/chat/counselor/{chatId}")
	public String adminChat(@PathVariable("chatId") String chatId, Model model){
		
		List<Msg> chatList = chatService.counselorFindChatListByChatId(chatId);
		model.addAttribute("chatList", chatList);
		
		log.debug("chatList={}",chatList);
		return "counselor/counselorChatList";
	}
	
	
	

}
