package kh.mclass.Igre.board.model.service;

import java.util.List;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.PostList;

public interface BoardService {

	List<Board> boardList();

	List<Post> postList(PostList bc, int cPage, int nPP);

}
