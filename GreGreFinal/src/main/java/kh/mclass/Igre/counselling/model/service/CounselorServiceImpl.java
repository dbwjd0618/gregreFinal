package kh.mclass.Igre.counselling.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.counselling.model.dao.CounselorDAO;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;

@Service
public class CounselorServiceImpl implements CounselorService {
	
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
//
//	@Override
//	public List<Review> selectReviewList(int cPage, int numPerPage) {
//		return counselorDAO.selectReviewList(cPage, numPerPage);
//	}

	@Override
	public int selectReviewTotalContents() {
		return counselorDAO.selectReviewTotalContents();
	}

@Override
public List<Review> selectReviewList(Counselor c) {
	return counselorDAO.selectReviewList(c);
}
}
