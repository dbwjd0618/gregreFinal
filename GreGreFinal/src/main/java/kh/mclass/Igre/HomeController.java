package kh.mclass.Igre;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.mclass.Igre.board.model.service.BoardService;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.inquire.model.service.InquireService;
import kh.mclass.Igre.inquire.model.vo.InqChatMember;
import kh.mclass.Igre.inquire.model.vo.InqChatRoom;
import kh.mclass.Igre.inquire.model.vo.InqMsg;
import kh.mclass.Igre.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes(value={"boardList"})
@Slf4j
public class HomeController {
	
	@Autowired
	private BoardService bs;
	
	@Autowired
	private InquireService is;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, @SessionAttribute(value="memberLoggedIn", required = false) Member member) {
		
		List<Board> boardList = bs.boardList();
		model.addAttribute("boardList", boardList);
		
		List<Post> idxNotice = bs.idxNotice();
		model.addAttribute("idxNotice", idxNotice);
		
		List<Post> favList = bs.favList();
		model.addAttribute("favList", favList);
		
		if(member != null) {
			String memberId = member.getMemberId();
			log.debug("memberId = " + memberId);
			model.addAttribute("memberId", memberId);
			String chatId = is.findChatId(memberId);
			
			if(chatId == null) {
				
				chatId = createChatId(20);
				
				log.debug("chatId = " + chatId);
				
				InqChatRoom cr = new InqChatRoom(chatId);
				log.debug("cr = " + cr);
				List<InqChatMember> list = new ArrayList<>();
				list.add(new InqChatMember(memberId, cr));
				list.add(new InqChatMember("admin000", cr));
				
				is.createChatRoom(list);
				
			} else {
				List<InqMsg> chatList = is.chatListByChatId(chatId);
				
				model.addAttribute("chatList", chatList);
			}
			
			log.debug("chatId = " + chatId);
			model.addAttribute("chatId", chatId);
		}
		
		LocalDate date = LocalDate.now();
		String yyyyMMdd = ""+date.getYear()+(date.getMonthValue()<10?"0":"")+date.getMonthValue()+(date.getDayOfMonth()<10?"0":"")+date.getDayOfMonth();
		log.debug("날짜 : " + yyyyMMdd);
		
		LocalTime time = LocalTime.now();
		String hhmm = ""+(time.getHour()<10?"0":"")+time.getHour()+"00";
//		(time.getMinute()<10?"0":"")+time.getMinute();
		log.debug("시간 : " + hhmm);
		
		//날씨
		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey=AB7ypAy1v6VldsoBOUnn2rR5MR0vMg49%2FZ58a4wOKmq1DsRPrhsp%2BSOPYG28WYggqc4%2FZOjOsZTusNDJ8CJR2Q%3D%3D&numOfRows=10&pageNo=1&base_date="+yyyyMMdd+"&base_time="+hhmm+"&nx=61&ny=125";
		HttpURLConnection urlconnection = null;
		BufferedReader br = null;
		String result = "";
		try{
            URL urll = new URL(url);
            urlconnection = (HttpURLConnection)urll.openConnection();
            urlconnection.setRequestMethod("GET");
            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String line = "";
            while((line = br.readLine()) != null) {
                result += line + "\n";
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        } finally {
        	urlconnection.disconnect();
        	try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
		model.addAttribute("weather", result);
		System.out.println(result);
		return "index";
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
	
}
