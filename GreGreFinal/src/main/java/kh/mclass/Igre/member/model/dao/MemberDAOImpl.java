package kh.mclass.Igre.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sss;

	@Override
	public Member selectId(String memberId) {
		return sss.selectOne("member.selectId", memberId);
	}
}
