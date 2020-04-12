package kh.mclass.IgreMall.admin.review.model.service;

import java.util.List;

import kh.mclass.IgreMall.admin.review.model.vo.AdminProdReview;

public interface AdminReviewService {

	List<AdminProdReview> selectListReview();

	int deleteReview(String reviewId);

}
