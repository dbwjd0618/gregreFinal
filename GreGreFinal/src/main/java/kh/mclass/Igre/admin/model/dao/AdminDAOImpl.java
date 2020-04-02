package kh.mclass.Igre.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;
import kh.mclass.Igre.admin.model.vo.AdminReport;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Admin selectOne(String adminId) {
		return sqlSession.selectOne("admin.selectOne", adminId);
	}

	@Override
	public List<Amember> list() {
		return sqlSession.selectList("admin.list");
	}

	@Override
	public Amember MemberSelectOne(String memberId) {
		return sqlSession.selectOne("admin.MemberSelectOne", memberId);
	}
	
	@Override
	public int updateMember(Amember amember) {
		return sqlSession.update("admin.memberUpdate", amember);
	}

	@Override
	public int updateAdmin(Amember amember) {
		return sqlSession.update("admin.adminUpdate", amember);
	}

	@Override
	public int delete(String memberId) {
		return sqlSession.delete("admin.delete", memberId);
	}

	@Override
	public List<Amember> deleteList() {
		return sqlSession.selectList("admin.deleteList");
	}

	@Override
	public List<AdminReport> report() {
		return sqlSession.selectList("admin.report");
	}

	@Override
	public int postDelete(String boardCode, Integer postNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("table", "tb_post_"+boardCode);
		map.put("postNo", postNo);
		return sqlSession.delete("admin.postDelete", map);
	}

	@Override
	public int reportUpdate(String boardCode, Integer postNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("boardCode", boardCode);
		map.put("postNo", postNo);
		return sqlSession.update("admin.reportUpdate", map);
	}

	@Override
	public int replyDelete(String boardCode, Integer replyNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("table","tb_reply_"+boardCode);
		map.put("replyNo", replyNo);
		return sqlSession.delete("admin.replyDelete", map);
	}

	@Override
	public int replyUpdate(String boardCode, Integer postNo, Integer replyNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("boardCode", boardCode);
		map.put("postNo", postNo);
		map.put("replyNo", replyNo);
		return sqlSession.update("admin.replyUpdate", map);
	}

	@Override
	public List<Board> board() {
		return sqlSession.selectList("admin.board");
	}

	@Override
	public int insertboard(Board board) {
		return sqlSession.insert("admin.insertBoard", board);
	}

	@Override
	public List<Post> boardList(String boardCode) {
		Map<String,String> map = new HashMap<>();
		map.put("boardCode", boardCode);
		return sqlSession.selectList("admin.boardList", map);
	}

	@Override
	public Board boardName(String boardCode) {
		Map<String, String> map = new HashMap<>();
		map.put("boardCode", boardCode);
		return sqlSession.selectOne("admin.boardName", map);
	}

	@Override
	public int boardPostDelete(String boardCode, Integer postNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("table", "tb_post_"+boardCode);
		map.put("postNo", postNo);
		return sqlSession.delete("admin.boardPostDelete", map);
	}

	@Override
	public int noticeUpdate(String boardCode, Integer postNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("table", "tb_post_"+boardCode);
		map.put("boardCode", boardCode);
		map.put("postNo", postNo);
		return sqlSession.update("admin.noticeUpdate", map);
	}

	@Override
	public List<Admin> adminList() {
		return sqlSession.selectList("admin.adminList");
	}

	@Override
	public List<Amember> amemberList() {
		return sqlSession.selectList("admin.amemberList");
	}

	@Override
	public void createBoard(Board board) {
		sqlSession.update("admin.createBoard", board);
	}

	@Override
	public void createReply(Board board) {
		sqlSession.update("admin.createReply", board);
	}

	@Override
	public void seqPost(Board board) {
		sqlSession.update("admin.seqPost", board);
	}

	@Override
	public void seqReply(Board board) {
		sqlSession.update("admin.seqReply", board);
	}




}
