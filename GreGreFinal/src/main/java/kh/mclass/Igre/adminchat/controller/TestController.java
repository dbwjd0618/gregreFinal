package kh.mclass.Igre.adminchat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import kh.mclass.Igre.adminchat.model.vo.AdminMSG;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TestController {
	
	@Autowired
	SimpMessagingTemplate simpMessagingTemplate;

	@MessageMapping("/admin/chat/{chatId}")
	@SendTo(value= {"/admin/chat/{chatId}"})
	public AdminMSG sendEcho(AdminMSG fromMessage,
							 @DestinationVariable String chatId) {
		log.debug("fromMessage={}", fromMessage);
		log.debug("chatId={}", chatId);
		log.debug("simpMessagingTemplate={}", simpMessagingTemplate);
		
		
//		simpMessagingTemplate.convertAndSend("/test/" + chatId, fromMessage);
//		adminChatService.insertChatLog(fromMessage);
		
		return fromMessage;
	}
}
