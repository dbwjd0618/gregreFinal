package kh.mclass.Igre.mypage.model.dao;

import java.util.List;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.vo.Child;
import kh.mclass.Igre.mypage.model.vo.Vaccination;

public interface MyPageDAO {

	List<Member> memberList();

	int updateMember(Member member);

	int enroll(Child child);

	int updateChildNumber(Member member);

	List<Child> selectChild(Child child);

	int updatePassword(Member member);

	int memberDelete(Member member);

	int insertVaccion(Vaccination vaccination);




}
