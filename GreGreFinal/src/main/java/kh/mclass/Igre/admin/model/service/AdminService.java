package kh.mclass.Igre.admin.model.service;

import java.util.List;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;

public interface AdminService {

	Admin selectOne(String adminId);

	List<Amember> list();

	int updateMember(Amember amember);

	Amember MemberSelectOne(String memberId);

	int updateAdmin(Amember amember);

}
