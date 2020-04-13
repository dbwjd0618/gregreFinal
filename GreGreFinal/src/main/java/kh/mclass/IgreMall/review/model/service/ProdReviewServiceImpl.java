package kh.mclass.IgreMall.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.review.model.dao.ProdReviewDAO;
import kh.mclass.IgreMall.review.model.vo.ProdReview;
import kh.mclass.IgreMall.review.model.vo.ReviewReco;

@Service
public class ProdReviewServiceImpl implements ProdReviewService {
		//	testpush
	@Autowired
	ProdReviewDAO reviewDAO;

	@Override
	public int insertReview(ProdReview prodReview) {
		return reviewDAO.insertReview(prodReview);
	}

	@Override
	public List<ProdReview> selectListReview(String productId) {
		return reviewDAO.selectListReview(productId);
	}

	@Override
	public String selectReviewId(String prodId) {
		return reviewDAO.selectReviewId(prodId);
	}

	@Override
	public List<ProdReview> selectListMyReview(String memberId) {
		return reviewDAO.selectListMyReview(memberId);
	}

	@Override
	public int updateReview(ProdReview prodReview) {
		return reviewDAO.updateReview(prodReview);
	}

	@Override
	public int deleteReview(String reviewId) {
		return reviewDAO.deleteReview(reviewId);
	}

	@Override
	public int updateReivewReco(ProdReview review) {
		return reviewDAO.updateReivewReco(review);
	}

	@Override
	public ProdReview selectReviewOne(String reviewId) {
		return reviewDAO.selectReviewOne(reviewId);
	}

	@Override
	public ReviewReco selectReviewReco(ReviewReco reviewReco) {
		return reviewDAO.selectReviewReco(reviewReco);

	}

	@Override
	public int updateRecoCheck(ReviewReco reviewReco1) {
		return reviewDAO.updateRecoCheck(reviewReco1);
	}

	@Override
	public int insertReviewReco(ReviewReco reviewReco1) {
		return reviewDAO.insertReviewReco(reviewReco1);
	}

	

	




}
