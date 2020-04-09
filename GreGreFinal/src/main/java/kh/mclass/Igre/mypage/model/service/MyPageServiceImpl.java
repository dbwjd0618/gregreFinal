package kh.mclass.Igre.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.counselling.model.vo.BookingInfo;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.dao.MyPageDAO;
import kh.mclass.Igre.mypage.model.vo.Child;
import kh.mclass.Igre.mypage.model.vo.Vaccination;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO mpd;

	@Override
	public List<Member> memberList() {
		// TODO Auto-generated method stub
		return mpd.memberList();
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return mpd.updateMember(member);
	}

	@Override
	public int enroll(Child child,Member member,Vaccination vaccination) {
		int result=0;
		result= mpd.enroll(child);
		vaccination.setParentsId(child.getParentsId());
		vaccination.setChildId(child.getChildId());
		result=mpd.insertVaccion(vaccination);
		member.setMemberId(child.getParentsId());
		result= mpd.updateChildNumber(member);
		return result;
	}

	@Override
	public List<Child> selectChild(Child child) {
		// TODO Auto-generated method stub
		return mpd.selectChild(child);
	}

	@Override
	public List<BookingInfo> selectBookingInfoList(BookingInfo book) {
		return mpd.selectBookingInfoList(book);
	}

	@Override
	public int updatePassword(Member member) {
		// TODO Auto-generated method stub
		return mpd.updatePassword(member);
	}

	@Override
	public int memberDelete(Member member) {
		// TODO Auto-generated method stub
		return mpd.memberDelete(member);
	}

	@Override
	public int reviewWrite(Review review) {
		// TODO Auto-generated method stub
		return mpd.reviewWrite(review);
	}
}

