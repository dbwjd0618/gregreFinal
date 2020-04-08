package kh.mclass.Igre.mail.controller;

import java.io.File;
import java.io.IOException;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/mail/mailSending")
	public String mailSending(HttpServletRequest request) {
		   
	    String setfrom = "yj22480095@gmail.com";
	    String emailto  = request.getParameter("emailto");     // 받는 사람 이메일
	    String[] memberList = emailto.split(",");
	    String subject   = request.getParameter("subject");      // 제목
	    String content = request.getParameter("content");    // 내용
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      for(int i=0; i<memberList.length; i++) {
	    	  
		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(memberList[i]); // 받는사람 이메일
		      messageHelper.setSubject(subject); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		      
		      mailSender.send(message);
	      }
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/admin/index.do";
	  }
}
