package kh.mclass.IgreMall.admin.coupon.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.admin.coupon.model.vo.AdminCoupon;
import kh.mclass.IgreMall.admin.coupon.model.vo.CouponPeople;

@Repository
public class AdminCouponDAOImpl implements AdminCouponDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertCoupon(AdminCoupon c) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminCoupon.insert",c);
	}

	@Override
	public List<AdminCoupon> couponList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminCoupon.couponList");
	}

	@Override
	public AdminCoupon selectCoupon(AdminCoupon a) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminCoupon.selectCoupon",a);
	}

	@Override
	public int sendCoupon(CouponPeople cp) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminCoupon.sendCoupon",cp);
	}

	@Override
	public AdminCoupon selectcurCoupon(AdminCoupon c) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminCoupon.selectcurCoupon",c);
	}
}
