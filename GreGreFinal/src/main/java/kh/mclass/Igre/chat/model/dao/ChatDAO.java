package kh.mclass.Igre.chat.model.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import kh.mclass.Igre.chat.model.vo.ChatInfo;
import kh.mclass.Igre.chat.model.vo.ChatMember;
import kh.mclass.Igre.chat.model.vo.ChatRoom;
import kh.mclass.Igre.chat.model.vo.CheckOK;
import kh.mclass.Igre.chat.model.vo.Msg;

public interface ChatDAO {

	String CounselorFindChatIdByMemberId(String memberId);

	int counselorInsertChatRoom(ChatRoom chatRoom);

	int counselorInsertChatMember(ChatMember chatMember);

	String counselorSelectOneChatId(String chatId);

	int counselorInsertChatLog(Msg fromMessage);

	List<Map<String, String>> counselorFindRecentList(String memberId);

	List<Msg> counselorFindChatListByChatId(String chatId);

	int counselorUpdateLastCheckC(Msg fromMessage);

	String counselorFindId(String memberId);

	int counselorRoomNum(String chatId);

	int counselorReadCountM(Map<String, Object> readCount);

	int counselorUpdateLastCheckM(Msg fromMessage);

	String memberFindId(String counselorId);

	int counselorReadCountC(Map<String, Object> readCount);

	String memberIdFindChatListByChatId(Map<String, String> infoFindId);

	ChatInfo counselorInfo(Map<String, String> infoId);

	int counselorCheckProduct(Map<String, Object> check);

	int counselorCheckToday(Map<String, Object> checkT);

	int counselorCheckOK(CheckOK ok);

	int counselorDownCoin(String memberId);

	int counselorCoinCheck(String memberId);

	int counselorOutChatRoom(String chatId);

	int counselorDeleteCheck(String chatId);



}
