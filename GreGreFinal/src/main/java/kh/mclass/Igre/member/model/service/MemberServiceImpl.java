package kh.mclass.Igre.member.model.service;


import java.util.List;

import java.util.ArrayList;
import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kh.mclass.Igre.member.model.dao.MemberDAO;
import kh.mclass.Igre.member.model.vo.Advis;
import kh.mclass.Igre.member.model.vo.BizMember;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.member.model.vo.Seller;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO md;

	@Override
	public Member selectId(String memberId) {
		return md.selectId(memberId);
	}
	
	@Override
	public int enroll(Member member) {
		// TODO Auto-generated method stub
		return md.enroll(member);
	}
	
	@Override
	public Object selectOne(String memberId) {
		// TODO Auto-generated method stub
		return md.selectOne(memberId);
	}

	@Override

	public Object selectOnec(String cmemberId) {
		// TODO Auto-generated method stub
		return md.selectOnec(cmemberId);
	}




	@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.READ_COMMITTED,
			rollbackFor = Exception.class)
	  
	 @Override public int bizEnroll(BizMember bizmember, List<Advis> advisList) {
		int result = 0;
		result = md.enroll(bizmember);
		System.out.println("serviceeeeeeeeeeeee"+bizmember.getCmemberId());
		for (Advis advism : advisList) {
			advism.setAdvisId(bizmember.getCmemberId());
			System.out.println("advismmmmmmmmmmm"+advism.getAdvisId());
			result = md.insertAdvis(advism);

		}
	  
	  
	  
	 return result; 
	 }

	@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.READ_COMMITTED,
			rollbackFor = Exception.class)
	@Override
	public int sellerEnroll(BizMember bizmember, Seller seller) {
		// TODO Auto-generated method stub
		int result = 0;
		seller.setSellerId(bizmember.getCmemberId());
		seller.setSellerPwd(bizmember.getMemberPwd());
		seller.setSellerPhone(bizmember.getPhone());
		result = md.enroll(bizmember);
		result = md.insert(seller);
		
		return result;
	}




	public HashMap<String, ArrayList<Integer>> preferList(String memberId) {
		return md.preferList(memberId);
	}

	@Override
	public BizMember selectBizId(String cmemberId) {
		// TODO Auto-generated method stub
		return md.selectBizId(cmemberId);
	}











}
