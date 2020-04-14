package kh.mclass.Igre.counselorAdmin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.counselling.model.vo.Counselor;

@Repository
public class CounselorAdminDAOImpl implements CounselorAdminDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Admin selectOne(String adminId) {
		return sqlSession.selectOne("cadmin.selectOne", adminId);
	}

	@Override
	public List<Counselor> list() {
		return sqlSession.selectList("cadmin.list");
	}

	@Override
	public Counselor counselorView(String advisId) {
		return sqlSession.selectOne("cadmin.counselorView", advisId);
	}

	@Override
	public int athorityUpdate(Counselor counselor) {
		return sqlSession.update("cadmin.athorityUpdate", counselor);
	}

	@Override
	public int counselorDelete(String advisId) {
		return sqlSession.delete("cadmin.counselorDelete", advisId);
	}

	@Override
	public Counselor counselorSelectOne(String advisId) {
		return sqlSession.selectOne("cadmin.counselorSelectOne", advisId);
	}

	@Override
	public int counselorUpdate(Counselor counselor) {
		return sqlSession.update("cadmin.counselorUpdate", counselor);
	}
	
	
}
