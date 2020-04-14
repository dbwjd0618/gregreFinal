package kh.mclass.IgreMall.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.review.model.vo.ProdReview;
import kh.mclass.IgreMall.review.model.vo.ReviewReco;

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

	@Override
	public int deleteReview(String reviewId) {
		return sqlSession.delete("prodReview.deleteReview", reviewId);
	}

	@Override
	public int updateReivewReco(ProdReview review) {
		return sqlSession.update("prodReview.updateReviewReco", review);
	}

	@Override
	public ProdReview selectReviewOne(String reviewId) {
		return sqlSession.selectOne("prodReview.selectReviewOne", reviewId);
	}

	@Override
	public ReviewReco selectReviewReco(ReviewReco reviewReco) {
		return sqlSession.selectOne("prodReview.selectReviewReco", reviewReco);
	}

	@Override
	public int updateRecoCheck(ReviewReco reviewReco) {
		return sqlSession.update("prodReview.updateRecoCheck", reviewReco);
	}

	@Override
	public int insertReviewReco(ReviewReco reviewReco) {
		return sqlSession.insert("prodReview.insertReviewReco", reviewReco);
	}

	

}
