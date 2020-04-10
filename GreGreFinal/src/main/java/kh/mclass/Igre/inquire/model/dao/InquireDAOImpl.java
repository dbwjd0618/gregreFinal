package kh.mclass.Igre.inquire.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.inquire.model.vo.InqChatMember;
import kh.mclass.Igre.inquire.model.vo.InqMsg;

@Repository
public class InquireDAOImpl implements InquireDAO {
	
	@Autowired
	private SqlSessionTemplate sss;

	@Override
	public String findChatId(String memberId) {
		return sss.selectOne("inquire.findChatId", memberId);
	}

	@Override
	public Object selectOneChatId(String chatId) {
		return sss.selectOne("inquire.selectOneChatId", chatId);
	}

	@Override
	public void createChatRoom(List<InqChatMember> list) {
		sss.insert("inquire.insertChatRoom", list.get(0));
	}

	@Override
	public void createChatMember(List<InqChatMember> list) {
		sss.insert("inquire.insertChatMember", list.get(0));
	}

	@Override
	public void insertChatLog(InqMsg fromMessage) {
		sss.insert("inquire.insertChatLog", fromMessage);
	}

	@Override
	public List<InqMsg> chatListByChatId(String chatId) {
		return sss.selectList("chatListByChatId", chatId);
	}

}
