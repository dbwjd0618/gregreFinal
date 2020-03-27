package kh.mclass.Igre.board.model.dao;

import java.util.List;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.PostList;

public interface BoardDAO {

	List<Board> boardList();

	List<Post> postList(PostList bc, int cPage, int nPP);

	String boardName(String boardCode);

	int postCount(String boardCode);

}
