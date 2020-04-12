package kh.mclass.Igre.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.admin.model.dao.AdminDAO;
import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;
import kh.mclass.Igre.admin.model.vo.AdminReport;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public Admin selectOne(String adminId) {
		return adminDAO.selectOne(adminId);
	}

	@Override
	public List<Amember> list() {
		return adminDAO.list();
	}

	@Override
	public Amember MemberSelectOne(String memberId) {
		return adminDAO.MemberSelectOne(memberId);
	}
	
	@Override
	public int updateMember(Amember amember) {
		return adminDAO.updateMember(amember);
	}

	@Override
	public int updateAdmin(Amember amember) {
		return adminDAO.updateAdmin(amember);
	}

	@Override
	public int delete(String memberId) {
		return adminDAO.delete(memberId);
	}

	@Override
	public List<Amember> deleteList() {
		return adminDAO.deleteList();
	}

	@Override
	public List<AdminReport> report() {
		return adminDAO.report();
	}

	@Override
	public int postDelete(String boardCode, Integer postNo) {
		return adminDAO.postDelete(boardCode, postNo);
	}

	@Override
	public int reportUpdate(String boardCode, Integer postNo) {
		return adminDAO.reportUpdate(boardCode, postNo);
	}

	@Override
	public int replyDelete(String boardCode, Integer replyNo) {
		return adminDAO.replyDelete(boardCode, replyNo);
	}

	@Override
	public int replyUpdate(String boardCode, Integer postNo, Integer replyNo) {
		return adminDAO.replyUpdate(boardCode, postNo, replyNo);
	}

	@Override
	public List<Board> board() {
		return adminDAO.board();
	}

	@Override
	public int insertboard(Board board) {
		adminDAO.createBoard(board);
		adminDAO.createReply(board); 
		adminDAO.seqPost(board);
		adminDAO.seqReply(board);
		 
		return adminDAO.insertboard(board);
	}

	@Override
	public int boardDelete(String boardCode) {
		adminDAO.dropReply(boardCode);
		adminDAO.dropBoard(boardCode);
		adminDAO.dropSeqPost(boardCode);
		adminDAO.dropSeqReply(boardCode);
		
		return adminDAO.boardDelete(boardCode);
	}

	
	@Override
	public List<Post> boardList(Map<String, String> param) {
		return adminDAO.boardList(param);
	}

	@Override
	public Board boardName(String boardCode) {
		return adminDAO.boardName(boardCode);
	}

	@Override
	public int boardPostDelete(String boardCode, Integer postNo) {
		return adminDAO.boardPostDelete(boardCode, postNo);
	}

	@Override
	public int noticeUpdate(String boardCode, Integer postNo) {
		return adminDAO.noticeUpdate(boardCode, postNo);
	}

	@Override
	public Post postView(Map<String, Object> param) {
		return adminDAO.postView(param);
	}

	@Override
	public List<Reply> replyView(Map<String, Object> param) {
		return adminDAO.replyView(param);
	}

	@Override
	public int replyCount(Map<String, Object> param) {
		return adminDAO.replyCount(param);
	}

	@Override
	public int prefCount(Map<String, Object> param) {
		return adminDAO.prefCount(param);
	}

	@Override
	public int postCount(Map<String, String> param) {
		return adminDAO.postCount(param);
	}

	@Override
	public List<Member> selectAdmember() {
		return adminDAO.selectAdmember();
	}

	@Override
	public Member athorityView(String memberId) {
		return adminDAO.athorityView(memberId);
	}

	@Override
	public int athorityUpdate(Member member) {
		return adminDAO.athorityUpdate(member);
	}

	@Override
	public List<Member> indexMember() {
		return adminDAO.indexMember();
	}

	@Override
	public List<Admin> indexAdmin() {
		return adminDAO.indexAdmin();
	}

	@Override
	public int allMemberCnt() {
		return adminDAO.allMemberCnt();
	}



	


}
