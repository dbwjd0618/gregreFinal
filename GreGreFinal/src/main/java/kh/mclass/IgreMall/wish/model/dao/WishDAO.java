package kh.mclass.IgreMall.wish.model.dao;

import java.util.List;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;
import kh.mclass.IgreMall.wish.model.vo.Wish;

public interface WishDAO {

	Wish selectWishOne(Wish wish);

	int updateWishCheck(Wish wish);

	int insertWish(Wish wish);

	List<Wish> selectWishList(String memberId);

	int deleteWishOne(Wish wish);



}
