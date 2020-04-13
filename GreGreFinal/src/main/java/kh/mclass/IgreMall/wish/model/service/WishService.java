package kh.mclass.IgreMall.wish.model.service;

import java.util.List;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;
import kh.mclass.IgreMall.wish.model.vo.Wish;

public interface WishService {

	Wish selectWishOne(Wish wish1);

	int updateWishCheck(Wish wish1);

	int insertWish(Wish wish1);

	List<Wish> selectWishList(String memberId);



}
