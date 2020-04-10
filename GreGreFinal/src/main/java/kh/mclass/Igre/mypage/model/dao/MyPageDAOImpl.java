package kh.mclass.Igre.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.counselling.model.vo.BookingInfo;
import kh.mclass.Igre.counselling.model.vo.Review;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.mypage.model.vo.Child;
import kh.mclass.Igre.mypage.model.vo.Vaccination;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Autowired
	private SqlSessionTemplate sss;

	@Override
	public List<Member> memberList() {
		// TODO Auto-generated method stub
		return sss.selectOne("mypage.memberList");
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return sss.update("mypage.updateMember",member);
	}

	@Override
	public int enroll(Child child) {
		// TODO Auto-generated method stub
		return sss.insert("mypage.enroll",child);
	}

	@Override
	public int updateChildNumber(Member member) {
		// TODO Auto-generated method stub
		return sss.update("mypage.updateChildNumber",member);
	}

	@Override
	public List<Child> selectChild(Child child) {
		// TODO Auto-generated method stub
		return sss.selectList("mypage.selectChild",child);
	}

	@Override
	public List<BookingInfo> selectBookingInfoList(BookingInfo book) {
		// TODO Auto-generated method stub
		return sss.selectList("mypage.selectBookingInfoList", book);
	}

	public int updatePassword(Member member) {
		// TODO Auto-generated method stub
		return sss.update("mypage.updatePassword",member);
	}

	@Override
	public int memberDelete(Member member) {
		// TODO Auto-generated method stub
		return sss.delete("mypage.memberDelete",member);

	}

	@Override
	public int reviewWrite(Review review) {
		// TODO Auto-generated method stub
		return sss.insert("review.reviewWrite", review);
	}

	@Override
	public int insertVaccion(Vaccination vaccination) {
		// TODO Auto-generated method stub
		return sss.insert("mypage.insertVaccion",vaccination);
	}

}
