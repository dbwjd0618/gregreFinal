package kh.mclass.Igre.member.model.dao;

import kh.mclass.Igre.member.model.vo.Member;

public interface MemberDAO {

	Member selectId(String memberId);

	int enroll(Member member);
	
	Object selectOne(String memberId);
}
