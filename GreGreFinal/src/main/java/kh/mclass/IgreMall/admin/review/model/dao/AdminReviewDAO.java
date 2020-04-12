package kh.mclass.IgreMall.admin.review.model.dao;

import java.util.List;

import kh.mclass.IgreMall.admin.review.model.vo.AdminProdReview;

public interface AdminReviewDAO {

	List<AdminProdReview> selectListReview();

	int deleteReview(String reviewId);

}
