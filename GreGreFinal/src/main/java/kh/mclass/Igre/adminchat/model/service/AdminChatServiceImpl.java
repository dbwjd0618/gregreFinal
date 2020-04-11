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
	public void insertChatLog(AdminMSG fromMessage) {
		adminChatDAO.insertChatLog(fromMessage);
	}
		 

}
