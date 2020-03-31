package kh.mclass.Igre.board.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Recommendation;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.member.model.vo.PreferList;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sss;

	@Override
	public List<Board> boardList() {
		return sss.selectList("board.boardList");
	}

	@Override
	public List<Post> postList(String boardCode, int cPage, int nPP) {
		
		int offset = (cPage-1)*nPP;
		int limit = nPP;
		RowBounds rbn = new RowBounds(offset, limit);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("table", "TB_post_"+boardCode);
		return sss.selectList("board.postList", map, rbn);
	}

	@Override
	public String boardName(String boardCode) {
		return sss.selectOne("board.boardName",boardCode);
	}

	@Override
	public int postCount(String boardCode) {
		boardCode = "TB_post_"+boardCode;
		HashMap<String, String> map = new HashMap<>();
		map.put("boardCode", boardCode);
		return sss.selectOne("board.postCount", map);
	}

	@Override
	public int preferIn(PreferList pf) {
		return sss.insert("board.preferIn", pf);
	}

	@Override
	public int preferOut(PreferList pf) {
		return sss.delete("board.preferOut", pf);
	}

	@Override
	public Post postView(String boardCode, int postNo) {
		HashMap<String, String> map = new HashMap<>();
		map.put("table", "TB_post_"+boardCode);
		map.put("postNo", ""+postNo);
		return sss.selectOne("board.postView", map);
	}

	@Override
	public List<Reply> replyList(String boardCode, int postNo, int cPage) {
		HashMap<String, String> map = new HashMap<>();
		map.put("table", "TB_reply_"+boardCode);
		map.put("postNo", ""+postNo);
		
		int limit = 10;
		int offset = (cPage-1)*limit;
		RowBounds rbd = new RowBounds(offset, limit);
		
		return sss.selectList("board.replyList", map, rbd);
	}

	@Override
	public int replyCount(String boardCode, int postNo) {
		HashMap<String, String> map = new HashMap<>();
		map.put("table", "TB_reply_"+boardCode);
		map.put("postNo", ""+postNo);
		
		return sss.selectOne("board.replyCount", map);
	}

	@Override
	public int preferCount(String boardCode, int postNo) {
		HashMap<String, String> map = new HashMap<>();
		map.put("boardCode", boardCode);
		map.put("postNo", ""+postNo);
		
		return sss.selectOne("board.preferCount", map);
	}

	@Override
	public int replyWrite(Reply reply) {
		return sss.insert("board.replyWrite", reply);
	}

	@Override
	public int checkComm(Recommendation recom) {
		return sss.selectOne("board.checkComm", recom);
	}

	@Override
	public int postRecom(Recommendation recom) {
		return sss.update("board.postRecom", recom);
	}

	@Override
	public int RecomDecom(Recommendation recom) {
		return sss.insert("board.RecomDecom", recom);
	}

	@Override
	public int replyRecom(Recommendation recom) {
		return sss.update("board.replyRecom", recom);
	}

	@Override
	public int postDecom(Recommendation recom) {
		return sss.update("board.postDecom", recom);
	}

	@Override
	public int replyDecom(Recommendation recom) {
		return sss.update("board.replyDecom", recom);
	}

	@Override
	public String confirmWriter(Post post) {
		return sss.selectOne("board.confirmWriter", post);
	}

	@Override
	public int deletePostR(Post post) {
		return sss.delete("board.deletePostR", post);
	}

	@Override
	public int deletePostP(Post post) {
		return sss.delete("board.deletePostP", post);
	}
}
