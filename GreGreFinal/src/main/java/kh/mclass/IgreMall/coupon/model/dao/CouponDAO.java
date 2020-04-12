package kh.mclass.IgreMall.coupon.model.dao;

import java.util.List;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;

public interface CouponDAO {

	List<Coupon> selectListMyCoupon(String memberId);


}
