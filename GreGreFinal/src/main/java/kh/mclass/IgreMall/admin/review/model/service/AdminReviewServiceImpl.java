package kh.mclass.IgreMall.admin.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.review.model.dao.AdminReviewDAO;
import kh.mclass.IgreMall.admin.review.model.vo.AdminProdReview;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {

	@Autowired
	AdminReviewDAO adminReviewDao;
	@Override
	public List<AdminProdReview> selectListReview() {
		return  adminReviewDao.selectListReview();
	}
	@Override
	public int deleteReview(String reviewId) {
		// TODO Auto-generated method stub
		return adminReviewDao.deleteReview(reviewId);
	}

}
