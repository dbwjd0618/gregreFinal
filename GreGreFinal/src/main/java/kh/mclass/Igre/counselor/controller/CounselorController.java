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
import kh.mclass.Igre.member.model.vo.BizMember;
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
					   @SessionAttribute(value="bizmemberLoggedIn", required=false) BizMember bizMember) {
		//로그인하지 않은 경우, IllegalStateException 예외 던짐.
		String counselorId = Optional.ofNullable(bizMember)//memberLoggedIn은 nullable하다. 로그인 하지 않은 경우 null
														  .map(BizMember::getCmemberId).orElseThrow(()-> new IllegalStateException("관리자만 이용할 수 있습니다."));
		
		model.addAttribute("counselorId", counselorId);
		log.debug("counselorId 속성값 설정되었음. [{}]",counselorId);
	}
		
	
	@GetMapping("/counsellingStart.do")
	public String counsellingStart(Model model, @ModelAttribute("counselorId")String counselorId) {
		
		
		//최근 사용자 채팅메세지 목록
		List<Map<String, String>> recentList = chatService.counselorFindRecentList(counselorId);
		
		log.debug("recentList={}",recentList);		
		model.addAttribute("recentList", recentList);

		return "counselor/counsellingStart";
	}
	
	
	@GetMapping("/chat/{chatId}")
	public String adminChat(@PathVariable("chatId") String chatId, Model model, @ModelAttribute("counselorId")String counselorId){
		
		List<Msg> chatList = chatService.counselorFindChatListByChatId(chatId);
		model.addAttribute("chatList", chatList);
		model.addAttribute("counselorId",counselorId);
		
		log.debug("chatList={}",chatList);
		return "counselor/counselorChat";
	}
	
	
	

}
