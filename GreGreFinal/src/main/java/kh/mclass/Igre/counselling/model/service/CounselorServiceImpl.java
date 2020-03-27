package kh.mclass.Igre.counselling.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.counselling.model.dao.CounselorDAO;

@Service
public class CounselorServiceImpl implements CounselorService {
	
	@Autowired
	private CounselorDAO counselorDAO;

	@Override
	public int selectCounselorTotalContents() {
		return counselorDAO.selectCounselorTotalContents();
	}
}
