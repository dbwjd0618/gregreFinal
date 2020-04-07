package kh.mclass.Igre.pregnancy.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.pregnancy.model.dao.PregnancyDAO;

@Service
public class PregnancyServiceImpl implements PregnancyService {
	
	@Autowired
	PregnancyDAO pregnancyDAO;

	@Override
	public int findTable(Member memberLoggedIn) {
		return pregnancyDAO.findTable(memberLoggedIn);
	}

	@Override
	public int insertMenses(Map<String, Object> menses) {
		return pregnancyDAO.insertMenses(menses);
	}
}
