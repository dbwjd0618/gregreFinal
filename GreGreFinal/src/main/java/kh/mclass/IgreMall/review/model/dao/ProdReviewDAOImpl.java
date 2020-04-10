package kh.mclass.IgreMall.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.review.model.vo.ProdReview;

@Repository
public class ProdReviewDAOImpl implements ProdReviewDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertReview(ProdReview prodReview) {
	
		return sqlSession.insert("prodReview.insertReview",prodReview);
	}

	@Override
	public List<ProdReview> selectListReview(String productId) {
		return sqlSession.selectList("prodReview.selectListReview",productId);
	}

	@Override
	public String selectReviewId(String prodId) {
		return sqlSession.selectOne("prodReview.selectReviewId",prodId);
	}

	@Override
	public List<ProdReview> selectListMyReview(String memberId) {
		return sqlSession.selectList("prodReview.selectListMyReview",memberId);
	}

	@Override
	public int updateReview(ProdReview prodReview) {
		return sqlSession.update("prodReview.updateReview", prodReview);
	}

	

}
