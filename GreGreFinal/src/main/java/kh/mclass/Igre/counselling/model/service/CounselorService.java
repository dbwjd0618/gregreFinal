package kh.mclass.Igre.counselling.model.service;

import java.util.List;
import java.util.Map;

import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;

public interface CounselorService {

	int selectCounselorTotalContents();

	List<Counselor> selectCounselorList(int cPage, int numPerPage);

	Counselor selectOne(String advisId);

//	List<Review> selectReviewList(int cPage, int numPerPage);

	int selectReviewTotalContents();

	List<Review> selectReviewList(Counselor c);

	List<Counselor> selectFilter(Map<String, String[]> param);

	double selectStarPoint(String advisId);

	int selectReviewTotal(String advisId);


}
