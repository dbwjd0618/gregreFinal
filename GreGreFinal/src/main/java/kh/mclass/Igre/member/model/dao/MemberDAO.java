package kh.mclass.Igre.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kh.mclass.Igre.member.model.vo.Member;

public interface MemberDAO {

	Member selectId(String memberId);

	int enroll(Member member);
	
	Object selectOne(String memberId);

	HashMap<String, ArrayList<Integer>> preferList(String memberId);
}
