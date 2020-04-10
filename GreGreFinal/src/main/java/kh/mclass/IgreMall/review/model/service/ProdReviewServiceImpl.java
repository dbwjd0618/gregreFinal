package kh.mclass.IgreMall.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.review.model.dao.ProdReviewDAO;
import kh.mclass.IgreMall.review.model.vo.ProdReview;

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

	

	




}
