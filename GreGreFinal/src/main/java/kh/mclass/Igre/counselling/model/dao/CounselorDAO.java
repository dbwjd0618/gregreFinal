package kh.mclass.Igre.counselling.model.dao;

import java.util.List;
import java.util.Map;

import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.counselling.model.vo.reviewStar;

public interface CounselorDAO {

	int selectCounselorTotalContents();

	List<Counselor> selectCounselorList(int cPage, int numPerPage);

	Counselor selectOne(String advisId);

	int selectReviewTotalContents();

	List<Review> selectReviewList(Counselor c);

	Double selectReviewRating(String advisId);

	int selectReviewCounselorOne(String advisId);

	List<reviewStar> particularReviewPointCount(String advisId);

	int countReview(Map<String, Object> map);


}
