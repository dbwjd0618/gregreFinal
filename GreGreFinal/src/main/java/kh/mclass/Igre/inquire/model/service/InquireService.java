package kh.mclass.Igre.inquire.model.service;

import java.util.List;

import kh.mclass.Igre.inquire.model.vo.InqChatMember;
import kh.mclass.Igre.inquire.model.vo.InqMsg;

public interface InquireService {

	String findChatId(String memberId);

	Object selectOneChatId(String chatId);

	void createChatRoom(List<InqChatMember> list);

	void insertChatLog(InqMsg fromMessage);

	List<InqMsg> chatListByChatId(String chatId);

	int updateLastCheck(InqMsg fromMessage);

	int lastCheck(String chatId, String memberId);

}
