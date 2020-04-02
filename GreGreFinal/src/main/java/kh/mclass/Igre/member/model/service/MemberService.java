package kh.mclass.Igre.member.model.service;

import java.util.List;

import kh.mclass.Igre.member.model.vo.Advis;
import kh.mclass.Igre.member.model.vo.BizMember;

import java.util.ArrayList;
import java.util.HashMap;


import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.member.model.vo.Seller;

public interface MemberService {

	Member selectId(String memberId);
	
	
	int enroll(Member member);
	

	int bizEnroll(BizMember bizmember, Advis advis);

	int sellerEnroll(BizMember bizmember, Seller seller);



	HashMap<String, ArrayList<Integer>> preferList(String memberId);


	BizMember selectBizId(String cmemberId);


	Object selectOne(String memberId);


	Object selectOneComp(String cmemberId);


	Object selectOneSomp(String cmemberId);








}
