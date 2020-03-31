package kh.mclass.Igre.counselling.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;

@Repository
public class CounselorDAOImpl implements CounselorDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectCounselorTotalContents() {
		return sqlSession.selectOne("counselor.selectCounselorTotalContents");
	}

	@Override
	public List<Counselor> selectCounselorList(int cPage, int numPerPage) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("counselor.selectCounselorList", null, rowBounds);
	}

	@Override
	public Counselor selectOne(String advisId) {
		
		return sqlSession.selectOne("counselor.selectOne", advisId);
	}

//	@Override
//	public List<Review> selectReviewList(int cPage, int numPerPage) {
//		
//		int offset = (cPage-1)*numPerPage;
//		int limit = numPerPage;
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		return sqlSession.selectList("review.selectReviewList", null, rowBounds);
//	}

	@Override
	public int selectReviewTotalContents() {
		return sqlSession.selectOne("review.selectReviewTotalContents");
	}

	@Override
	public List<Review> selectReviewList(Counselor c) {
		return sqlSession.selectList("review.selectReviewList",c);
	}

	@Override
	public Double selectReviewRating(String advisId) {
		
		return sqlSession.selectOne("review.selectReviewRating",advisId);
	}
}
