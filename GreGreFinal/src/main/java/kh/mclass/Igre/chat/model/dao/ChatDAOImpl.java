package kh.mclass.Igre.chat.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.chat.model.vo.ChatInfo;
import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.ChatRoom;
import kh.mclass.Igre.chat.model.vo.CheckOK;
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
	public int counselorUpdateLastCheckC(Msg fromMessage) {
		return sqlSession.update("counselor.updateLastCheckC",fromMessage);
	}

	@Override
	public String counselorFindId(String memberId) {
		return sqlSession.selectOne("counselor.counselorFindId",memberId);
	}

	@Override
	public int counselorRoomNum(String chatId) {
		return sqlSession.selectOne("counselor.counselorRoomNum",chatId);
	}

	@Override
	public int counselorReadCountM(Map<String, Object> readCount) {
		return sqlSession.selectOne("counselor.counselorReadCountM",readCount);
	}

	@Override
	public int counselorUpdateLastCheckM(Msg fromMessage) {
		return sqlSession.update("counselor.updateLastCheckM", fromMessage);
	}

	@Override
	public String memberFindId(String counselorId) {
		return sqlSession.selectOne("counselor.memberFindId",counselorId);
	}

	@Override
	public int counselorReadCountC(Map<String, Object> readCount) {
		return sqlSession.selectOne("counselor.counselorReadCountC",readCount);
	}

	@Override
	public String memberIdFindChatListByChatId(Map<String, String> infoFindId) {
		return sqlSession.selectOne("counselor.memberIdFindChatListByChatId",infoFindId);
	}

	@Override
	public ChatInfo counselorInfo(Map<String, String> infoId) {
		return sqlSession.selectOne("counselor.counselorInfo",infoId);
	}

	@Override
	public int counselorCheckProduct(Map<String, Object> check) {
		return sqlSession.selectOne("counselor.counselorCheckProduct",check);
	}

	@Override
	public int counselorCheckToday(Map<String, Object> checkT) {
		return sqlSession.selectOne("counselor.counselorCheckToday",checkT);
	}

	@Override
	public int counselorCheckOK(CheckOK ok) {
		return sqlSession.insert("counselor.counselorCheckOK", ok);
	}

	@Override
	public int counselorDownCoin(String memberId) {
		return sqlSession.update("counselor.counselorDownCoin", memberId);
	}

	@Override
	public int counselorCoinCheck(String memberId) {
		return sqlSession.selectOne("counselor.counselorCoinCheck", memberId);
	}

	@Override
	public int counselorOutChatRoom(String chatId) {
		return sqlSession.update("counselor.counselorOutChatRoom",chatId);
	}

	@Override
	public int counselorDeleteCheck(String chatId) {
		return sqlSession.delete("counselor.counselorDeleteCheck", chatId);
	}
}
