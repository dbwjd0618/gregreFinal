package kh.mclass.Igre.board.model.dao;

import java.util.List;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Recommendation;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.member.model.vo.PreferList;

public interface BoardDAO {

	List<Board> boardList();

	List<Post> postList(String boardCode, int cPage, int nPP);

	String boardName(String boardCode);

	int postCount(String boardCode);

	int preferIn(PreferList pf);

	int preferOut(PreferList pf);

	Post postView(String boardCode, int postNo);

	List<Reply> replyList(String boardCode, int postNo, int cPage);

	int replyCount(String boardCode, int postNo);

	int preferCount(String boardCode, int postNo);

	int replyWrite(Reply reply);

	int checkComm(Recommendation recom);

	int postRecom(Recommendation recom);

	int RecomDecom(Recommendation recom);

	int replyRecom(Recommendation recom);

	int postDecom(Recommendation recom);

	int replyDecom(Recommendation recom);

	String confirmWriter(Post post);

	int deletePostR(Post post);

	int deletePostP(Post post);

}
