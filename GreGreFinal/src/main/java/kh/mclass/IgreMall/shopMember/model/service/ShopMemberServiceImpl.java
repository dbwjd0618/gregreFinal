package kh.mclass.IgreMall.shopMember.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.shopMember.model.dao.ShopMemberDAO;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;

@Service
public class ShopMemberServiceImpl implements ShopMemberService {
	@Autowired
	ShopMemberDAO shopMemberDAO;

	@Override
	public ShopMember selectOne(String memberId) {
		return shopMemberDAO.selectOne(memberId);
	}

	@Override
	public CouponInfo selectCouponInfoOne(String couponId) {
		return shopMemberDAO.selectCouponInfoOne(couponId);
	}

	@Override
	public int insertCart(Cart cart) {
		return shopMemberDAO.insertCart(cart);
	}

	@Override
	public List<Cart> selectCartList(String memberId) {
		return shopMemberDAO.selectCartList(memberId);
	}

	@Override
	public Cart selectCartOne(String cartId) {
		return shopMemberDAO.selectCartOne(cartId);
	}

	@Override
	public int updateCartOne(Cart cart) {
		return shopMemberDAO.updateCartOne(cart);
	}

	@Override
	public int updateConsumerInfo(ShopMember sMem) {
		return shopMemberDAO.updateConsumerInfo(sMem);
	}

	@Override
	public int updateCoupon(Coupon coupon) {
		return shopMemberDAO.updateCoupon(coupon);
	}

	@Override
	public int deleteCart(String cartId) {
		return shopMemberDAO.deleteCart(cartId);
	}

	@Override
	public ShopMember selectShopMem(String memberId) {
		return shopMemberDAO.selectShopMem(memberId);
	}

	@Override
	public int insertShopMem(ShopMember sMem) {
		return shopMemberDAO.insertShopMem(sMem);
	}
}
