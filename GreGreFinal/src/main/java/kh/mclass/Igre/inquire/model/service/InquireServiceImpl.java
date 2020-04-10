package kh.mclass.Igre.inquire.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.inquire.model.dao.InquireDAO;
import kh.mclass.Igre.inquire.model.vo.InqChatMember;
import kh.mclass.Igre.inquire.model.vo.InqMsg;

@Service
public class InquireServiceImpl implements InquireService {
	
	@Autowired
	private InquireDAO id;

	@Override
	public String findChatId(String memberId) {
		return id.findChatId(memberId);
	}

	@Override
	public Object selectOneChatId(String chatId) {
		return id.selectOneChatId(chatId);
	}

	@Override
	public void createChatRoom(List<InqChatMember> list) {
		id.createChatRoom(list);
		id.createChatMember(list);
	}

	@Override
	public void insertChatLog(InqMsg fromMessage) {
		id.insertChatLog(fromMessage);
	}

	@Override
	public List<InqMsg> chatListByChatId(String chatId) {
		return id.chatListByChatId(chatId);
	}

}
