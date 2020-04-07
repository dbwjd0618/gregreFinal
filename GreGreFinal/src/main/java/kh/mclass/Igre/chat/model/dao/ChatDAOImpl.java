package kh.mclass.Igre.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.ChatRoom;
import kh.mclass.Igre.chat.model.vo.Msg;

@Repository
public class ChatDAOImpl implements ChatDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public String CounselorFindChatIdByMemberId(String memberId) {
		return sqlSession.selectOne("counselor.findChatIdByMemberId", memberId);
	}

	@Override
	public int counselorInsertChatRoom(ChatRoom chatRoom) {
		return sqlSession.insert("counselor.insertChatRoom", chatRoom);
	}

	@Override
	public int counselorInsertChatMember(ChatMember chatMember) {
		return sqlSession.insert("counselor.insertChatMember", chatMember);
	}

	@Override
	public String counselorSelectOneChatId(String chatId) {
		return sqlSession.selectOne("counselor.selectOneChatId", chatId);
	}

	@Override
	public int counselorInsertChatLog(Msg fromMessage) {
		return sqlSession.insert("counselor.insertChatLog", fromMessage);
	}

	@Override
	public List<Map<String, String>> counselorFindRecentList(String memberId) {
		return sqlSession.selectList("counselor.findRecentList", memberId);
	}

	@Override
	public List<Msg> counselorFindChatListByChatId(String chatId) {
		return sqlSession.selectList("counselor.findChatListByChatId",chatId);
	}

	@Override
	public int counselorUpdateLastCheck(Msg fromMessage) {
		return sqlSession.update("counselor.updateLastCheck",fromMessage);
	}

	@Override
	public String counselorFindId(String memberId) {
		return sqlSession.selectOne("counselor.counselorFindId",memberId);
	}
}
