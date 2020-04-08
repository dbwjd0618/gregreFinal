package kh.mclass.Igre.inquire.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;

import kh.mclass.Igre.inquire.model.service.InquireService;
import kh.mclass.Igre.inquire.model.vo.InqChatMember;
import kh.mclass.Igre.inquire.model.vo.InqChatRoom;
import kh.mclass.Igre.inquire.model.vo.InqMsg;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/inq")
@Slf4j
public class InquireController {
	
	@Autowired
	private InquireService is;
	
	@GetMapping("/chat")
	public void chat(Model model, @ModelAttribute("memberId") String memberId) {
		String chatId = is.findChatId(memberId);
		
		if(chatId == null) {
			
			chatId = createChatId(20);
			
			InqChatRoom cr = new InqChatRoom(chatId);
			List<InqChatMember> list = new ArrayList<>();
			list.add(new InqChatMember(memberId, cr));
			list.add(new InqChatMember("admin", cr));
			
			is.createChatRoom(list);
			
		} else {
			
		}
		
		
		model.addAttribute("chatId", chatId);
		
		return; 
	}
	
	private String createChatId(int len){
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
		} while(is.selectOneChatId(buf.toString()) != null);
		
		return buf.toString();
	}
	
	@MessageMapping("/chat/{chatId}")
	@SendTo(value = {"/chat/{chatId}, /chat/admin/push"})
	public InqMsg sendEcho(InqMsg fromMessage, @DestinationVariable String chatId) {
		log.debug("fromMessage = {}", fromMessage);
		is.insertChatLog(fromMessage);
		
		return fromMessage;
	}

}
