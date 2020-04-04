package kh.mclass.Igre.chat.model.dao;

import java.util.List;
import java.util.Map;

import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.ChatRoom;
import kh.mclass.Igre.chat.model.vo.Msg;

public interface ChatDAO {

	String CounselorFindChatIdByMemberId(String memberId);

	int counselorInsertChatRoom(ChatRoom chatRoom);

	int counselorInsertChatMember(ChatMember chatMember);

	String counselorSelectOneChatId(String chatId);

	int counselorInsertChatLog(Msg fromMessage);

	List<Map<String, String>> counselorFindRecentList();

	List<Msg> counselorFindChatListByChatId(String chatId);

	int counselorUpdateLastCheck(Msg fromMessage);



}
