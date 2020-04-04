package kh.mclass.Igre.chat.model.service;

import java.util.List;
import java.util.Map;

import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.Msg;

public interface ChatService {

	String CounselorFindChatIdByMemberId(String memberId);

	int counselorCreateChatRoom(List<ChatMember> list);

	String counselorSelectOneChatId(String chatId);

	int counselorInsertChatLog(Msg fromMessage);

	List<Map<String, String>> counselorFindRecentList();

	List<Msg> counselorFindChatListByChatId(String chatId);

	int counselorUpdateLastCheck(Msg fromMessage);

	

}
