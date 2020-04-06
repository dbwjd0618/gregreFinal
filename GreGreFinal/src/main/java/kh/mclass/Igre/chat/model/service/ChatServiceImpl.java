package kh.mclass.Igre.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.chat.model.dao.ChatDAO;
import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.ChatRoom;
import kh.mclass.Igre.chat.model.vo.Msg;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDAO chatDAO;

	@Override
	public String CounselorFindChatIdByMemberId(String memberId) {
		return chatDAO.CounselorFindChatIdByMemberId(memberId);
	}

	@Override
	public int counselorCreateChatRoom(List<ChatMember> list) {
		int result = 0;
		//chat_room 행 생성
		ChatRoom chatRoom = list.get(0).getChatRoom();//모든 chatMember 같은 ChatRoom객체를 공유함.
		result = chatDAO.counselorInsertChatRoom(chatRoom);
		System.out.println("chatRoom------------------------------"+chatRoom);
		
		//chat_member 행 생성
		for(ChatMember chatMember: list){
			result += chatDAO.counselorInsertChatMember(chatMember);
		}
		return result;
		
	}

	@Override
	public String counselorSelectOneChatId(String chatId) {
		return chatDAO.counselorSelectOneChatId(chatId);
	}

	@Override
	public int counselorInsertChatLog(Msg fromMessage) {
		return chatDAO.counselorInsertChatLog(fromMessage);
	}

	@Override
	public List<Map<String, String>> counselorFindRecentList(String memberId) {
		return chatDAO.counselorFindRecentList(memberId);
	}

	@Override
	public List<Msg> counselorFindChatListByChatId(String chatId) {
		return chatDAO.counselorFindChatListByChatId(chatId);
	}

	@Override
	public int counselorUpdateLastCheck(Msg fromMessage) {
		return chatDAO.counselorUpdateLastCheck(fromMessage);
	}

	//구매 상담사 아이디 조회
	@Override
	public String counselorFindId(String memberId) {
		return chatDAO.counselorFindId(memberId);
	}

	
}
