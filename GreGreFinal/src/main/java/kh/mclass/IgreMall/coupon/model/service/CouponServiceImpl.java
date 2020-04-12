package kh.mclass.IgreMall.coupon.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.coupon.model.dao.CouponDAO;
import kh.mclass.IgreMall.coupon.model.vo.Coupon;

@Service
public class CouponServiceImpl implements CouponService {
		//	testpush
	@Autowired
	CouponDAO couponDAO;



	@Override
	public List<Coupon> selectListMyCoupon(String memberId) {
		return couponDAO.selectListMyCoupon(memberId);
	}

	

	




}
