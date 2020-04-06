package kh.mclass.Igre.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.board.model.dao.BoardDAO;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Recommendation;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.board.model.vo.Report;
import kh.mclass.Igre.member.model.vo.PreferList;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO bd;

	@Override
	public List<Board> boardList() {
		return bd.boardList();
	}

	@Override
	public List<Post> postList(Map<String, Object> param) {
		return bd.postList(param);
	}

	@Override
	public String boardName(Map<String, Object> param) {
		return bd.boardName(param);
	}

	@Override
	public int postCount(Map<String, Object> param) {
		return bd.postCount(param);
	}

	@Override
	public int preferIn(PreferList pf) {
		return bd.preferIn(pf);
	}

	@Override
	public int preferOut(PreferList pf) {
		return bd.preferOut(pf);
	}

	@Override
	public Post postView(Map<String, Object> param) {
		return bd.postView(param);
	}

	@Override
	public List<Reply> replyList(Map<String, Object> param) {
		return bd.replyList(param);
	}

	@Override
	public int replyCount(Map<String, Object> param) {
		return bd.replyCount(param);
	}

	@Override
	public int preferCount(Map<String, Object> param) {
		return bd.preferCount(param);
	}

	@Override
	public int replyWrite(Reply reply) {
		return bd.replyWrite(reply);
	}

	@Override
	public int checkComm(Recommendation recom) {
		return bd.checkComm(recom);
	}

	@Override
	public int recommenP(Recommendation recom) {
		int result = bd.postRecom(recom);
		result += bd.RecomDecom(recom);
		return result;
	}

	@Override
	public int recommenR(Recommendation recom) {
		int result = bd.replyRecom(recom);
		result += bd.RecomDecom(recom);
		return result;
	}

	@Override
	public int decommenP(Recommendation recom) {
		int result = bd.postDecom(recom);
		result += bd.RecomDecom(recom);
		return result;
	}

	@Override
	public int decommenR(Recommendation recom) {
		int result = bd.replyDecom(recom);
		result += bd.RecomDecom(recom);
		return result;
	}

	@Override
	public String confirmWriter(Post post) {
		return bd.confirmWriter(post);
	}

	@Override
	public int deletePost(Post post) {
		int result = bd.deletePostR(post);
		result += bd.deletePostP(post);
		return result;
	}

	@Override
	public String confirmWriter(Reply reply) {
		return bd.confirmWriter(reply);
	}

	@Override
	public int deleteReply(Reply reply) {
		return bd.deleteReply(reply);
	}

	@Override
	public int checkReport(Report report) {
		return bd.checkReport(report);
	}

	@Override
	public int submitReport(Report report) {
		return bd.submitReport(report);
	}

	@Override
	public int postWrite(Post post) {
		return bd.postWrite(post);
	}

	@Override
	public int postViewCount(Map<String, Object> param) {
		return bd.postViewCount(param);
	}

	@Override
	public void replyModify(Reply reply) {
		bd.replyModify(reply);
	}

	@Override
	public Post postView(Post post) {
		return bd.postView(post);
	}


}
