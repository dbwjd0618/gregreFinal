package kh.mclass.IgreMall.coupon.model.service;

import java.util.List;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;


public interface CouponService {
	
	List<Coupon> selectListMyCoupon(String memberId);


}
