package kh.mclass.Igre.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.member.model.vo.Member;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSessionTemplate sss;

	@Override
	public List<Member> memberList() {
		// TODO Auto-generated method stub
		return sss.selectOne("mypage.memberList");
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return sss.update("mypage.updateMember",member);
	}
}
