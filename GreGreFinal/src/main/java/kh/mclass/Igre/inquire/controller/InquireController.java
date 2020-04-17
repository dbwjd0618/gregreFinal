package kh.mclass.Igre.inquire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.mclass.Igre.chat.model.vo.Msg;
import kh.mclass.Igre.inquire.model.service.InquireService;
import kh.mclass.Igre.inquire.model.vo.InqMsg;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/inq")
@Slf4j
public class InquireController {
	
	@Autowired
	private InquireService is;
	
	@MessageMapping("/inq/chat/{chatId}")
	@SendTo(value = {"/inq/chat/{chatId}", "/admin/chat/{chatId}"})
	public InqMsg sendEcho(InqMsg fromMessage, @DestinationVariable String chatId) {
		log.debug("fromMessage = {}", fromMessage);
		is.insertChatLog(fromMessage);
		
		return fromMessage;
	}
	
	@MessageMapping("/inq/lastCheck/{chatId}")
	@SendTo(value={"/inq/chat/{chatId}"})
	public InqMsg lastCheckM(@RequestBody InqMsg fromMessage, @DestinationVariable String chatId){
		log.debug("lastCheckM={}",fromMessage);
		System.out.println("AAA");
		log.debug("chatId = " + chatId);
		int result = is.updateLastCheck(fromMessage);
		log.debug("lastCheck 완료");
		return fromMessage; 
	}

}
