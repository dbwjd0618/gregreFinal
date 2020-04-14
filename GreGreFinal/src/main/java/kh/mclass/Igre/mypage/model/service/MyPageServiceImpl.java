package kh.mclass.Igre.mypage.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.counselling.model.vo.BookingInfo;
import kh.mclass.Igre.counselling.model.vo.Counselor;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.member.model.vo.BizMember;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.dao.MyPageDAO;
import kh.mclass.Igre.mypage.model.vo.Child;
import kh.mclass.Igre.mypage.model.vo.Period;
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
	public int enroll(Child child,Member member,Vaccination vaccination,String[] vaccinCode,Date[] vaccinDate,Integer[] nth) {
		int result=0;
		result= mpd.enroll(child);
		for(int i= 0; i<vaccinCode.length;i++) {
			vaccination.setVaccinCode(vaccinCode[i]);
			vaccination.setVaccinDate(vaccinDate[i]);
			vaccination.setNth(nth[i]);
			vaccination.setParentsId(child.getParentsId());
			vaccination.setChildId(child.getChildId());
			result=mpd.insertVaccion(vaccination);
		}

		
		
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

	@Override
	public List<Vaccination> selectVaccination(Vaccination vaccination) {
		// TODO Auto-generated method stub
		return mpd.selectVaccination(vaccination);
	}

	@Override
	public Member findPassword(Member member) {
		member= mpd.findPassword(member);
		return member;
		
	}

	@Override
	public int fupdatePassword(Member member) {
		int result = 0;
		result= mpd.fupdatePassword(member);
		return result;
	}

	@Override

	public Member findId(Member member) {
		member=mpd.findId(member);
		return member;
	}

	@Override
	public int childUpdateInfo(Child child) {
		int result =0;
		result = mpd.childUpdateInfo(child);
		return result;
	}

	@Override
	public int deleteChild(Child child) {
		int result =0;
		result = mpd.deleteChild(child);
		
		return result;
	}

	@Override
	public int periodAdd(Period period) {
		return mpd.periodAdd(period);
	}


	public List<BookingInfo> selectProgressCounselling(Counselor c) {
		// TODO Auto-generated method stub
		return mpd.selectProgressCounselling(c);
	}


	@Override
	public List<BookingInfo> selectEndCounselling(Counselor c) {
		// TODO Auto-generated method stub
		return mpd.selectEndCounselling(c);
	}

	@Override
	public int updateCounselor(Counselor c) {
		// TODO Auto-generated method stub
		return mpd.updateCounselor(c);
	}

	@Override
	public Counselor selectCounselorOne(String cmemberId) {
		// TODO Auto-generated method stub
		return mpd.selectCounselorOne(cmemberId);
	}

	@Override
	public Counselor selectCounselorOne1(String cmemberId) {
		// TODO Auto-generated method stub
		return mpd.selectCounselorOne1(cmemberId);
	}
	
	@Override
	public List<Period> selectPeriod(Period period) {
		// TODO Auto-generated method stub
		return mpd.selectPeriod(period);

	}


}

