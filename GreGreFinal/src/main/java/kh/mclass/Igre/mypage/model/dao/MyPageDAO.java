package kh.mclass.Igre.mypage.model.dao;

import java.util.List;

import kh.mclass.Igre.member.model.vo.Member;

public interface MyPageDAO {

	List<Member> memberList();

	int updateMember(Member member);


}
