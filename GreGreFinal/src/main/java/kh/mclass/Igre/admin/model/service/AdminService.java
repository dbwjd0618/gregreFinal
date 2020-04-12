package kh.mclass.Igre.admin.model.service;

import java.util.List;
import java.util.Map;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;
import kh.mclass.Igre.admin.model.vo.AdminReport;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.member.model.vo.Member;

public interface AdminService {

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

	List<Post> boardList(Map<String, String> param);

	Board boardName(String boardCode);

	int boardPostDelete(String boardCode, Integer postNo);

	int noticeUpdate(String boardCode, Integer postNo);

	int boardDelete(String boardCode);

	Post postView(Map<String, Object> param);

	List<Reply> replyView(Map<String, Object> param);

	int replyCount(Map<String, Object> param);

	int prefCount(Map<String, Object> param);

	int postCount(Map<String, String> param);

	List<Member> selectAdmember();

	Member athorityView(String memberId);

	int athorityUpdate(Member member);

	List<Member> indexMember();

	List<Admin> indexAdmin();

	int allMemberCnt();




}
