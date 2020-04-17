package kh.mclass.Igre.inquire.model.dao;

import java.util.List;

import kh.mclass.Igre.chat.model.vo.Msg;
import kh.mclass.Igre.inquire.model.vo.InqChatMember;
import kh.mclass.Igre.inquire.model.vo.InqMsg;

public interface InquireDAO {

	String findChatId(String memberId);

	Object selectOneChatId(String chatId);

	int createChatRoom(List<InqChatMember> list);

	void createChatMember(List<InqChatMember> list);

	void insertChatLog(InqMsg fromMessage);

	List<InqMsg> chatListByChatId(String chatId);

	int updateLastCheck(InqMsg fromMessage);

	int lastCheck(String chatId, String memberId);

}
