package kh.mclass.Igre.counselorAdmin.model.dao;

import java.util.List;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.counselling.model.vo.Counselor;

public interface CounselorAdminDAO {

	Admin selectOne(String adminId);

	List<Counselor> list();

}
