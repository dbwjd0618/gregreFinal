package kh.mclass.Igre.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kh.mclass.Igre.chat.model.service.ChatService;
import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.ChatRoom;
import kh.mclass.Igre.chat.model.vo.Msg;
import kh.mclass.Igre.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@ModelAttribute
	public void common(Model model, 
					   HttpSession session, 
					   @SessionAttribute(value="memberLoggedIn", required=false) Member memberLoggedIn) {
		//비회원일 경우, httpSessionId값을 memberId로 사용한다.
		String memberId = memberLoggedIn.getMemberId();//HttpSession의 JSESSIONID값을 저장
		model.addAttribute("memberId", memberId);
		log.debug("memberId 속성값 설정되었음. [{}]",memberId);
	}
	

	@GetMapping("/counsellingStart.do")
	public String counsellingStart(Model model, @ModelAttribute("memberId")String memberId) {
		
		String chatId = chatService.CounselorFindChatIdByMemberId(memberId);
		
		//최근 사용자 채팅메세지 목록
		List<Map<String, String>> recentList = chatService.counselorFindRecentList(memberId);
		
		log.debug("recentList={}",recentList);		
		model.addAttribute("recentList", recentList);
		

		return "counselling/counsellingStart";
	}
	
	//채팅방 생성
	
	@GetMapping("/counselorChat")
	public String chat(Model model, @ModelAttribute("memberId")String memberId){
		
		//chatId조회
		//1. chat_view에 memberId가 속한 chatId 조회. 없으면 null.
		String chatId = chatService.CounselorFindChatIdByMemberId(memberId);
		
		//상담사 ID 검색
		String counselorId = chatService.counselorFindId(memberId);
		
		model.addAttribute("counselorId",counselorId);
		
		//2.로그인을 하지 않았거나, 로그인을 해도 최초접속인 경우 chatId를 발급하고 db에 저장한다.
		if(chatId == null){
			chatId = counselorCreateChatId(20);//chat_randomToken -> jdbcType=char(20byte)
			
			ChatRoom chatRoom = new ChatRoom(chatId);
			List<ChatMember> list = new ArrayList<>();
			list.add(new ChatMember(memberId, chatRoom));
			list.add(new ChatMember(counselorId, chatRoom));
			
			//chat_room, chat_member테이블에 데이터 생성
			chatService.counselorCreateChatRoom(list);

		}
		//chatId가 존재하는 경우, 채팅내역 조회
		else{
			List<Msg> chatList = chatService.counselorFindChatListByChatId(chatId);
			model.addAttribute("chatList", chatList);
		}
		
		log.debug("memberId=[{}], chatId=[{}]",memberId, chatId);
		
		model.addAttribute("chatId", chatId);
		
		return "chat/counselorChat";
	}
	
	private String counselorCreateChatId(int len){
		Random rnd = new Random();
		StringBuffer buf = new StringBuffer();
		String prefix = "chat";
		
		do {
			buf.setLength(0);//buf 비우기 
			buf.append(prefix);
			for(int i=0; i<len-prefix.length(); i++){
				//임의의 참거짓에 따라 참=>영대소문자, 거짓=> 숫자
				switch(rnd.nextInt(3)) {
				case 0: buf.append((char)(rnd.nextInt(26)+65)); break;
				case 1: buf.append((char)(rnd.nextInt(26)+97)); break;
				case 2: buf.append((rnd.nextInt(10))); break;
				}
			}
		//중복여부 검사
		} while(chatService.counselorSelectOneChatId(buf.toString()) != null);
		log.info("chatId가 생성되었음 [{}]",buf.toString());
		
		return buf.toString();
	}
	
	//채팅 실행
	@MessageMapping("/chattt/counselor/{chatId}")
	@SendTo(value={"/chat/counselor/{chatId}", "/chat/counselor/{counselorId}/push"})
	public Msg sendEcho(Msg fromMessage, @DestinationVariable String chatId){
		System.out.println("실행");
		log.debug("fromMessage={}",fromMessage);
		
		//db에 메세지로그
		chatService.counselorInsertChatLog(fromMessage);

		return fromMessage; 
	}
	

	
	
	/**
	 * 읽음 여부 확인을 위해 최종 focus된 시각정보를 수집한다.
	 * 
	 * @param fromMessage
	 * @return
	 */
	@MessageMapping("/lastCheck")
	@SendTo(value={"/chat/counselor/{counselorId}/push"})
	public Msg lastCheck(@RequestBody Msg fromMessage){
		log.debug("lastCheck={}",fromMessage);
		
		chatService.counselorUpdateLastCheck(fromMessage);
		
		return fromMessage; 
	}
	

}
