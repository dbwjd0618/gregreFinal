package kh.mclass.Igre.counselorAdmin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselorAdmin.model.dao.CounselorAdminDAO;

@Service
public class CounselorAdminServiceImpl implements CounselorAdminService {
	
	@Autowired
	CounselorAdminDAO cadminDAO;

	@Override
	public Admin selectOne(String adminId) {
		return cadminDAO.selectOne(adminId);
	}

	@Override
	public List<Counselor> list() {
		return cadminDAO.list();
	}
	
	
	

}
