package kh.mclass.Igre.board.model.dao;

import java.util.List;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.PostList;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.member.model.vo.PreferList;

public interface BoardDAO {

	List<Board> boardList();

	List<Post> postList(PostList bc, int cPage, int nPP);

	String boardName(String boardCode);

	int postCount(String boardCode);

	int preferIn(PreferList pf);

	int preferOut(PreferList pf);

	Post postView(String boardCode, int postNo);

	List<Reply> replyList(String boardCode, int postNo, int cPage);

	int replyCount(String boardCode, int postNo);

	int preferCount(String boardCode, int postNo);

}
