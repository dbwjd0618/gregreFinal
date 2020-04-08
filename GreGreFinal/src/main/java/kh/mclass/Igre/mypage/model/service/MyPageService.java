package kh.mclass.Igre.mypage.model.service;

import java.util.List;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.vo.Child;
import kh.mclass.Igre.mypage.model.vo.Vaccination;

public interface MyPageService {

	List<Member> memberList();

	int updateMember(Member member);

	int enroll(Child child,Member member,Vaccination vaccination);

	List<Child> selectChild(Child child);

	int updatePassword(Member member);

	int memberDelete(Member member);

}
