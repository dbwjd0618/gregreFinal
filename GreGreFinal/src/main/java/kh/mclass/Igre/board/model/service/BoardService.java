package kh.mclass.Igre.board.model.service;

import java.util.List;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Recommendation;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.board.model.vo.Report;
import kh.mclass.Igre.member.model.vo.PreferList;

public interface BoardService {

	List<Board> boardList();

	List<Post> postList(String boardCode, int cPage, int nPP);

	String boardName(String boardCode);

	int postCount(String boardCode);

	int preferIn(PreferList pf);

	int preferOut(PreferList pf);

	Post postView(String boardCode, int postNo);

	List<Reply> replyList(String boardCode, int postNo, int i);

	int replyCount(String boardCode, int postNo);

	int preferCount(String boardCode, int postNo);

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


}
