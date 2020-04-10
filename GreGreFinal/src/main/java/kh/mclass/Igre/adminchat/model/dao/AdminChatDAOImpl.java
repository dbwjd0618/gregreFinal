package kh.mclass.Igre.adminchat.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.adminchat.model.vo.AdminMSG;

@Repository
public class AdminChatDAOImpl implements AdminChatDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> findRecentList(String adminId) {
		Map<String,String> map = new HashMap<>();
		map.put("adminId", adminId);
		return sqlSession.selectList("stomp.findRecentList", map);
	}

	@Override
	public List<AdminMSG> findChatListByChatId(String chatId) {
		return sqlSession.selectList("stomp.findChatListByChatId", chatId);
	}

	/*
	 * @Override public List<Map<String, Object>> findChatListMapByChatId(String
	 * chatId) { Map<String, String> map = new HashMap<>(); map.put("chatId",
	 * chatId); return sqlSession.selectList("stomp.findChatListMapByChatId", map);
	 * }
	 */
	

}
