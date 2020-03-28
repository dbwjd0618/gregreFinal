package kh.mclass.Igre.board.model.service;

import java.util.List;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.PostList;
import kh.mclass.Igre.member.model.vo.PreferList;

public interface BoardService {

	List<Board> boardList();

	List<Post> postList(PostList bc, int cPage, int nPP);

	String boardName(String boardCode);

	int postCount(String boardCode);

	int preferIn(PreferList pf);

}
