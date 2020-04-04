package kh.mclass.Igre.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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

import kh.mclass.Igre.chat.model.service.ChatService;
import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.ChatRoom;
import kh.mclass.Igre.chat.model.vo.Msg;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/counselorChat")
	public String chat(Model model, @ModelAttribute("memberId")String memberId){
		
		//chatId조회
		//1. chat_view에 memberId가 속한 chatId 조회. 없으면 null.
		String chatId = chatService.CounselorFindChatIdByMemberId(memberId);
		
		//2.로그인을 하지 않았거나, 로그인을 해도 최초접속인 경우 chatId를 발급하고 db에 저장한다.
		if(chatId == null){
			chatId = counselorCreateChatId(20);//chat_randomToken -> jdbcType=char(20byte)
			
			ChatRoom chatRoom = new ChatRoom(chatId);
			List<ChatMember> list = new ArrayList<>();
			list.add(new ChatMember(memberId, chatRoom));
			list.add(new ChatMember("counselor", chatRoom));
			
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
	
	@MessageMapping("/chat/counselor/{chatId}")
	@SendTo(value={"/chat/counselor/{chatId}", "/chat/counselor/push"})
	public Msg sendEcho(Msg fromMessage, @DestinationVariable String chatId){
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
	@MessageMapping("/counselorLastCheck")
	@SendTo(value={"/chat/counselor/push"})
	public Msg lastCheck(@RequestBody Msg fromMessage){
		log.debug("lastCheck={}",fromMessage);
		
		chatService.counselorUpdateLastCheck(fromMessage);
		
		return fromMessage; 
	}
	

}
