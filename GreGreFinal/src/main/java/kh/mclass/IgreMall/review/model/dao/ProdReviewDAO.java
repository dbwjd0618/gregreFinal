package kh.mclass.IgreMall.review.model.dao;

import java.util.List;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.review.model.vo.ProdReview;

public interface ProdReviewDAO {

	int insertReview(ProdReview prodReview);

	List<ProdReview> selectListReview(String productId);

	String selectReviewId(String prodId);

	List<ProdReview> selectListMyReview(String memberId);

	int updateReview(ProdReview prodReview);

	int deleteReview(String reviewId);




}
