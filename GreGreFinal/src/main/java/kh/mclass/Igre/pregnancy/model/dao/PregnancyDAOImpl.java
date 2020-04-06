package kh.mclass.Igre.pregnancy.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.member.model.vo.Member;

@Repository
public class PregnancyDAOImpl implements PregnancyDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int findTable(Member memberLoggedIn) {
		System.out.println(memberLoggedIn);
		memberLoggedIn.setMemberId(memberLoggedIn.getMemberId().toUpperCase());
		return sqlSession.selectOne("pregnancy.findTable",memberLoggedIn);
	}
}
