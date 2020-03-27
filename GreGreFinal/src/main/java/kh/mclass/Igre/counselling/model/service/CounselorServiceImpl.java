package kh.mclass.Igre.counselling.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.counselling.model.dao.CounselorDAO;
import kh.mclass.Igre.counselling.model.vo.Counselor;

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
}
