package kh.mclass.Igre.adminchat.model.dao;

import java.util.List;
import java.util.Map;

import kh.mclass.Igre.adminchat.model.vo.AdminMSG;

public interface AdminChatDAO {

	List<Map<String, String>> findRecentList(String adminId);

	List<Map<String, Object>> findChatListMapByChatId(String chatId);

	int insertChatLog(AdminMSG fromMessage);

	void updateLastCheck(AdminMSG fromMessage);



}
