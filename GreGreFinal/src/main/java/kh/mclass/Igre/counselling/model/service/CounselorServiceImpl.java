package kh.mclass.Igre.counselling.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.counselling.model.dao.CounselorDAO;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.EditReview;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.counselling.model.vo.BookingInfo;
import kh.mclass.Igre.counselling.model.vo.reviewStar;
import kh.mclass.Igre.member.model.vo.Member;

@Service
public class CounselorServiceImpl implements CounselorService {
	
	@Override
	public Double selectReviewRating(String advisId) {
		return counselorDAO.selectReviewRating(advisId);
	}

	@Autowired
	private CounselorDAO counselorDAO;

	@Override
	public int selectCounselorTotalContents() {
		return counselorDAO.selectCounselorTotalContents();
	}

	@Override
	public List<Counselor> selectCounselorList(int cPage, int numPerPage) {
		return counselorDAO.selectCounselorList(cPage, numPerPage);
	}

	@Override
	public Counselor selectOne(String advisId) {
		return counselorDAO.selectOne(advisId);
	}

	@Override
	public int selectReviewTotalContents() {
		return counselorDAO.selectReviewTotalContents();
	}
	
	@Override
	public List<Map<String, String>> selectReviewList(Counselor c, int cPage, int numPerPage) {
		return counselorDAO.selectReviewList(c, cPage, numPerPage);
	}
	
	
	
	@Override
	public List<Counselor> selectFilter(Map<String, String[]> param) {
		return counselorDAO.selectFilter(param);
	}
	
	@Override
	public double selectStarPoint(String advisId) {
		return counselorDAO.selectStarPoint(advisId);
	}

	@Override
	public int selectReviewTotal(String advisId) {
		return counselorDAO.selectReviewTotal(advisId);
	}
	
	@Override
	public int selectReviewCounselorOne(String advisId) {
		return counselorDAO.selectReviewCounselorOne(advisId);
	}

	@Override
	public List<reviewStar> particularReviewPointCount(String advisId) {
		return counselorDAO.particularReviewPointCount(advisId);
	}

	@Override
	public int countReview(String advisId, int starPoint) {
		Map<String, Object> map = new HashMap<>();
		map.put("advisId", advisId);
		map.put("starPoint", starPoint);
		return counselorDAO.countReview(map);
	}

	@Override
	public List<Map<String, String>> selectCounselorList1(int cPage, int numPerPage) {
		return counselorDAO.selectCounselorList1(cPage, numPerPage);
	}

	@Override
	public BookingInfo bookingInsert(BookingInfo info) {
		counselorDAO.bookingInsert(info);
		BookingInfo result = counselorDAO.bookingSelect(info.getAppointNo());
		
		return result;
	}

	@Override
	public int editReview(EditReview edit) {
		return counselorDAO.editReview(edit);
	}

	@Override
	public int deleteReview(int num) {
		return counselorDAO.deleteReview(num);
	}

	@Override
	public int recentSelectOne(String memberId) {
		return counselorDAO.recentSelectOne(memberId);
	}



}
