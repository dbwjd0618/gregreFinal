package kh.mclass.Igre.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.dao.MyPageDAO;

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
}

