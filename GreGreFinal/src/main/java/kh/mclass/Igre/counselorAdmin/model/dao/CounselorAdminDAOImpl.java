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
	
	
}
