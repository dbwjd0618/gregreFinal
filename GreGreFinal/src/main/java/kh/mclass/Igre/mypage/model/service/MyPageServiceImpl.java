package kh.mclass.Igre.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.dao.MyPageDAO;
import kh.mclass.Igre.mypage.model.vo.Child;

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
	public int enroll(Child child,Member member) {
		int result=0;
		result= mpd.enroll(child);
		member.setMemberId(child.getParentsId());
		result= mpd.updateChildNumber(member);
		return result;
	}

	@Override
	public List<Child> selectChild(Child child) {
		// TODO Auto-generated method stub
		return mpd.selectChild(child);
	}
}

