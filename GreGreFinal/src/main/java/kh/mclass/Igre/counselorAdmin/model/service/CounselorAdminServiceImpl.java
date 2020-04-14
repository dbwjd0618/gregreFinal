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

	@Override
	public Counselor counselorView(String advisId) {
		return cadminDAO.counselorView(advisId);
	}

	@Override
	public int athorityUpdate(Counselor counselor) {
		return cadminDAO.athorityUpdate(counselor);
	}

	@Override
	public int counselorDelete(String advisId) {
		return cadminDAO.counselorDelete(advisId);
	}

	@Override
	public Counselor counselorSelectOne(String advisId) {
		return cadminDAO.counselorSelectOne(advisId);
	}

	@Override
	public int counselorUpdate(Counselor counselor) {
		return cadminDAO.counselorUpdate(counselor);
	}
	
	
	

}
