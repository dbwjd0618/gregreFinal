package kh.mclass.Igre.inquire.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int createChatRoom(List<InqChatMember> list) {
		sss.insert("inquire.insertChatRoom", list.get(0));
		return sss.selectOne("inquire.configRoomId");
	}

	@Override
	public void createChatMember(List<InqChatMember> list) {
		sss.insert("inquire.insertChatMember", list.get(0));
		sss.insert("inquire.insertChatMember", list.get(1));
	}

	@Override
	public void insertChatLog(InqMsg fromMessage) {
		sss.insert("inquire.insertChatLog", fromMessage);
	}

	@Override
	public List<InqMsg> chatListByChatId(String chatId) {
		return sss.selectList("inquire.chatListByChatId", chatId);
	}

	@Override
	public int updateLastCheck(InqMsg fromMessage) {
		System.out.println("DAO 시작");
		System.out.println(fromMessage);
		System.out.println("이건되나?" + sss.selectOne("inquire.test"));
		
		int result = sss.update("inquire.lcUpdate", fromMessage);
		System.out.println("last 끝!" + result);
		return result;
	}

	@Override
	public int lastCheck(String chatId, String memberId) {
		Map<String, String> param = new HashMap<>();
		param.put("chatId", chatId);
		param.put("memberId", memberId);
		param.put("lastCheck", sss.selectOne("inquire.lastCheck", param));
		return sss.selectOne("inquire.lcReturn", param);
	}

}
