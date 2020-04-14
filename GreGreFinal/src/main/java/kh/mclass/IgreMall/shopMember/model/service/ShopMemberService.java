package kh.mclass.IgreMall.shopMember.model.service;

import java.util.List;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;

public interface ShopMemberService {

	ShopMember selectOne(String memberId);

	CouponInfo selectCouponInfoOne(String couponId);

	int insertCart(Cart cart);

	List<Cart> selectCartList(String memberId);

	Cart selectCartOne(String cartId);

	int updateCartOne(Cart cart);

	int updateConsumerInfo(ShopMember sMem);

	int updateCoupon(Coupon coupon);

	int deleteCart(String cartId);

	ShopMember selectShopMem(String memberId);

	int insertShopMem(ShopMember sMem);

}
