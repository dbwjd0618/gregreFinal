package kh.mclass.Igre.admin.model.dao;

import java.util.List;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;
import kh.mclass.Igre.admin.model.vo.AdminReport;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;

public interface AdminDAO {

	Admin selectOne(String adminId);

	List<Amember> list();

	int updateMember(Amember amember);

	Amember MemberSelectOne(String memberId);

	int updateAdmin(Amember amember);

	int delete(String memberId);

	List<Amember> deleteList();

	List<AdminReport> report();

	int postDelete(String boardCode, Integer postNo);

	int reportUpdate(String boardCode, Integer postNo);

	int replyDelete(String boardCode, Integer replyNo);

	int replyUpdate(String boardCode, Integer postNo, Integer replyNo);

	List<Board> board();

	int insertboard(Board board);

	List<Post> boardList(String boardCode);

	Board boardName(String boardCode);

	int boardPostDelete(String boardCode, Integer postNo);

	int noticeUpdate(String boardCode, Integer postNo);

	List<Admin> adminList();

	List<Amember> amemberList();

	void createBoard(Board board);

	void createReply(Board board);

	void seqPost(Board board);

	void seqReply(Board board);


}
