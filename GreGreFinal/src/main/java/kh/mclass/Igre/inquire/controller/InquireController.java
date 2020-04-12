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
	
	@MessageMapping("/chat/{chatId}")
	@SendTo(value = {"/chat/{chatId}, /chat/admin/push"})
	public InqMsg sendEcho(InqMsg fromMessage, @DestinationVariable String chatId) {
		log.debug("fromMessage = {}", fromMessage);
		is.insertChatLog(fromMessage);
		
		return fromMessage;
	}
	
	@MessageMapping("/lastCheck/{chatId}")
	@SendTo(value={"/chat/admin/push"})
	public Msg lastCheckM(@RequestBody Msg fromMessage){
		log.debug("lastCheckM={}",fromMessage);
//		is.updateLastCheck(fromMessage);
		
		return fromMessage; 
	}

}
