package kh.mclass.Igre.mypage.model.service;

import java.util.List;

import kh.mclass.Igre.member.model.vo.Member;

public interface MyPageService {

	List<Member> memberList();

	int updateMember(Member member);

}
