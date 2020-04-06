package kh.mclass.Igre.counselling.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.counselling.model.vo.bookingInfo;
import kh.mclass.Igre.counselling.model.vo.reviewStar;
import kh.mclass.Igre.member.model.vo.Member;

public interface CounselorService {

	int selectCounselorTotalContents();

	List<Counselor> selectCounselorList(int cPage, int numPerPage);

	Counselor selectOne(String advisId);

	int selectReviewTotalContents();

	List<Map<String, String>> selectReviewList(Counselor c, int cPage, int numPerPage);

	List<Counselor> selectFilter(Map<String, String[]> param);

	double selectStarPoint(String advisId);

	int selectReviewTotal(String advisId);

	int selectReviewCounselorOne(String advisId);

	List<reviewStar> particularReviewPointCount(String advisId);

	int countReview(String advisId, int starPoint);

	Double selectReviewRating(String advisId);

	List<Map<String, String>> selectCounselorList1(int cPage, int numPerPage);

	int bookingInsert(bookingInfo info);


}
