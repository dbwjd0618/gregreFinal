package kh.mclass.Igre.counselorAdmin.model.service;

import java.util.List;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.counselling.model.vo.Counselor;

public interface CounselorAdminService {

	Admin selectOne(String adminId);

	List<Counselor> list();

}
