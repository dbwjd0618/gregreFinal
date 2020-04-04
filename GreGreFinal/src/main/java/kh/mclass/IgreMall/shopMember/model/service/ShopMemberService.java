package kh.mclass.IgreMall.shopMember.model.service;

import java.util.List;

import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;

public interface ShopMemberService {

	ShopMember selectOne(String memberId);

	CouponInfo selectCouponInfoOne(String couponId);

	int insertCart(Cart cart);

	List<Cart> selectCartList(String memberId);

}
