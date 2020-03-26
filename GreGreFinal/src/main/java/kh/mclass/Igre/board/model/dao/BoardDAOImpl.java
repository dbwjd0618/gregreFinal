package kh.mclass.Igre.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.PostList;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate sss;

	@Override
	public List<Board> boardList() {
		return sss.selectList("board.boardList");
	}

	@Override
	public List<Post> postList(PostList bc, int cPage, int nPP) {
		
		int offset = (cPage-1)*nPP;
		int limit = nPP;
		RowBounds rbn = new RowBounds(offset, limit);
		
		bc.setBoardCode("TB_post_"+bc.getBoardCode());
		log.debug("boardCode = " + bc.getBoardCode());
		return sss.selectList("board.postList", bc, rbn);
	}
}
