package kh.mclass.Igre.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Admin selectOne(String adminId) {
		return sqlSession.selectOne("admin.selectOne", adminId);
	}

	@Override
	public List<Amember> list() {
		return sqlSession.selectList("admin.list");
	}

	@Override
	public Amember MemberSelectOne(String memberId) {
		return sqlSession.selectOne("admin.MemberSelectOne", memberId);
	}
	
	@Override
	public int updateMember(Amember amember) {
		return sqlSession.update("admin.memberUpdate", amember);
	}

	@Override
	public int updateAdmin(Amember amember) {
		return sqlSession.update("admin.adminUpdate", amember);
	}



}
