package kh.mclass.Igre.admin.model.dao;

import java.util.List;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;

public interface AdminDAO {

	Admin selectOne(String adminId);

	List<Amember> list();

	int updateMember(Amember amember);

	Amember MemberSelectOne(String memberId);

	int updateAdmin(Amember amember);

}
