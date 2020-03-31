package kh.mclass.Igre.counselling.model.service;

import java.util.List;

import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;

public interface CounselorService {

	int selectCounselorTotalContents();

	List<Counselor> selectCounselorList(int cPage, int numPerPage);

	Counselor selectOne(String advisId);

//	List<Review> selectReviewList(int cPage, int numPerPage);

	int selectReviewTotalContents();

	List<Review> selectReviewList(Counselor c);

	Double selectReviewRating(String advisId);

}
