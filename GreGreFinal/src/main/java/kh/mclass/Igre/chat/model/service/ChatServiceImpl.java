package kh.mclass.Igre.chat.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.chat.model.dao.ChatDAO;
import kh.mclass.Igre.chat.model.vo.ChatInfo;
import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.ChatRoom;
import kh.mclass.Igre.chat.model.vo.CheckOK;
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
	public int counselorUpdateLastCheckC(Msg fromMessage) {
		return chatDAO.counselorUpdateLastCheckC(fromMessage);
	}

	//구매 상담사 아이디 조회
	@Override
	public String counselorFindId(String memberId) {
		return chatDAO.counselorFindId(memberId);
	}

	@Override
	public int counselorRoomNum(String chatId) {
		return chatDAO.counselorRoomNum(chatId);
	}

	@Override
	public int counselorReadCountM(Map<String, Object> readCount) {
		
		return chatDAO.counselorReadCountM(readCount);
	}

	@Override
	public int counselorUpdateLastCheckM(Msg fromMessage) {
		
		return chatDAO.counselorUpdateLastCheckM(fromMessage);
	}

	@Override
	public String memberFindId(String counselorId) {
		return chatDAO.memberFindId(counselorId);
	}

	@Override
	public int counselorReadCountC(Map<String, Object> readCount) {
		
		return chatDAO.counselorReadCountC(readCount);
	}

	@Override
	public String memberIdFindChatListByChatId(String counselorId) {
		return chatDAO.memberIdFindChatListByChatId(counselorId);
	}

	@Override
	public ChatInfo counselorInfo(String counselorId) {
		return chatDAO.counselorInfo(counselorId);
	}

	@Override
	public int counselorCheckProduct(Map<String, Object> check) {
		return chatDAO.counselorCheckProduct(check);
	}

	@Override
	public int counselorCheckToday(Map<String, Object> checkT) {
		return chatDAO.counselorCheckToday(checkT);
	}

	@Override
	public int counselorCheckOK(CheckOK ok) {
		return chatDAO.counselorCheckOK(ok);
	}

	@Override
	public int counselorDownCoin(String memberId) {
		return chatDAO.counselorDownCoin(memberId);
	}

	@Override
	public int counselorCoinCheck(String memberId) {
		return chatDAO.counselorCoinCheck(memberId);
	}

	@Override
	public int counselorOutChatRoom(String chatId) {
		return chatDAO.counselorOutChatRoom(chatId);
	}


	
}
