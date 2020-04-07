package kh.mclass.Igre.mypage.model.service;

import java.util.List;

import kh.mclass.Igre.counselling.model.vo.BookingInfo;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.vo.Child;

public interface MyPageService {

	List<Member> memberList();

	int updateMember(Member member);

	int enroll(Child child,Member member);

	List<Child> selectChild(Child child);

	List<BookingInfo> selectBookingInfoList(BookingInfo book);

}
