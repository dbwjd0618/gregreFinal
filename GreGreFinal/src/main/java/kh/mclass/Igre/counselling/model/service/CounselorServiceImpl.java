package kh.mclass.Igre.counselling.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.counselling.model.dao.CounselorDAO;

@Service
public class CounselorServiceImpl implements CounselorService {
	
	@Autowired
	private CounselorDAO counselorDAO;
}
