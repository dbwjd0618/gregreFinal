package kh.mclass.Igre.sms.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.mclass.Igre.sms.vo.Coolsms;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SMSController {

	@RequestMapping(value="/sendSms.do")
	public String sendSms(HttpServletRequest request,
						  @RequestParam("messageto") String messageto,
						  @RequestParam("message")	String message) throws Exception {
		
		//messageto = 01091933403, 01011111111, 01034422532
		String api_key = "NCSXWSZZA9VJZT0L";
	    String api_secret = "9DR57JHMT9AWCOOLAHCVXMZUM4MFIIOS";
	    String[] memberArr = messageto.split(",");
	    Coolsms coolsms = new Coolsms(api_key, api_secret);

	    HashMap<String, String> map = new HashMap<String, String>();
	    
		for(int i=0; i<memberArr.length; i++) {
			log.debug(memberArr[i]);
			map.put("from", "01091933403"); // 발신번호
			map.put("to", memberArr[i]); // 수신번호
			map.put("text", message); // 문자내용
			map.put("type", "sms"); // 문자 타입
			
		  JSONObject result = coolsms.send(map); // 보내기&전송결과받기
		}
		
	  /*  if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println("성공");
	      System.out.println(result.get("group_id")); // 그룹아이디
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println("실패");
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }*/
		
		return "redirect:/admin/index.do";
	}
		
	
}
