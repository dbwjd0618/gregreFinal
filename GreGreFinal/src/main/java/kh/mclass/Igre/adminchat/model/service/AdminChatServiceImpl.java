package kh.mclass.Igre.adminchat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.adminchat.model.dao.AdminChatDAO;
import kh.mclass.Igre.adminchat.model.vo.AdminMSG;

@Service
public class AdminChatServiceImpl implements AdminChatService {
	
	@Autowired
	AdminChatDAO adminChatDAO;

	@Override
	public List<Map<String, String>> findRecentList(String adminId) {
		return adminChatDAO.findRecentList(adminId);
	}

	@Override 
	public List<Map<String, Object>> findChatListMapByChatId(String chatId) { 
		return adminChatDAO.findChatListMapByChatId(chatId); 
		
	}

	@Override
	public int insertChatLog(AdminMSG fromMessage) {
		updateLastCheck(fromMessage);
		return adminChatDAO.insertChatLog(fromMessage);
	}

	@Override
	public void updateLastCheck(AdminMSG fromMessage) {
		adminChatDAO.updateLastCheck(fromMessage);
	}


}
