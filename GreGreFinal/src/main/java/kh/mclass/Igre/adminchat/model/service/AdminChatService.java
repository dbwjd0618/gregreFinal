package kh.mclass.Igre.adminchat.model.service;

import java.util.List;
import java.util.Map;

import kh.mclass.Igre.adminchat.model.vo.AdminMSG;

public interface AdminChatService {

	List<Map<String, String>> findRecentList(String adminId);

	List<AdminMSG> findChatListByChatId(String chatId);

	/* List<Map<String, Object>> findChatListMapByChatId(String chatId); */


}
