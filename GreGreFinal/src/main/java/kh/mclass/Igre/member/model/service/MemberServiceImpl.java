package kh.mclass.Igre.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.member.model.dao.MemberDAO;
import kh.mclass.Igre.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO md;

	@Override
	public Member selectId(String memberId) {
		return md.selectId(memberId);
	}

}
