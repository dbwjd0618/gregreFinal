package kh.mclass.Igre.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;
import kh.mclass.Igre.admin.model.vo.Report;

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

	@Override
	public int delete(String memberId) {
		return sqlSession.delete("admin.delete", memberId);
	}

	@Override
	public List<Amember> deleteList() {
		return sqlSession.selectList("admin.deleteList");
	}

	@Override
	public List<Report> report() {
		return sqlSession.selectList("admin.report");
	}

	@Override
	public int reportDelete(int reportNo) {
		return sqlSession.delete("admin.reportDelete");
	}



}
