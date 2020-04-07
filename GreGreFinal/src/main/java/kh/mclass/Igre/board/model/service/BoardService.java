package kh.mclass.Igre.board.model.service;

import java.util.List;
import java.util.Map;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Recommendation;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.board.model.vo.Report;
import kh.mclass.Igre.member.model.vo.PreferList;

public interface BoardService {

	List<Board> boardList();

	List<Post> postList(Map<String, Object> param);

	String boardName(Map<String, Object> param);

	int postCount(Map<String, Object> param);

	int preferIn(PreferList pf);

	int preferOut(PreferList pf);

	Post postView(Map<String, Object> param);

	List<Reply> replyList(Map<String, Object> param);

	int replyCount(Map<String, Object> param);

	int preferCount(Map<String, Object> param);

	int replyWrite(Reply reply);

	int checkComm(Recommendation recom);

	int recommenP(Recommendation recom);

	int recommenR(Recommendation recom);

	int decommenP(Recommendation recom);

	int decommenR(Recommendation recom);

	String confirmWriter(Post post);

	int deletePost(Post post);

	String confirmWriter(Reply reply);

	int deleteReply(Reply reply);

	int checkReport(Report report);

	int submitReport(Report report);

	int postWrite(Post post);

	int postViewCount(Map<String, Object> param);

	void replyModify(Reply reply);

	Post postView(Post post);

	int modifyPost(Post post);


}
