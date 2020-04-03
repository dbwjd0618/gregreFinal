package kh.mclass.IgreMall.shopMember.model.dao;

import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;

public interface ShopMemberDAO {

	ShopMember selectOne(String memberId);

	CouponInfo selectCouponInfoOne(String couponId);

	int insertCart(Cart cart);

}
