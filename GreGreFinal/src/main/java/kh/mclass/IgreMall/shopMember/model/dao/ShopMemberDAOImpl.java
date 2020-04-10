package kh.mclass.IgreMall.shopMember.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;

@Repository
public class ShopMemberDAOImpl implements ShopMemberDAO{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public ShopMember selectOne(String memberId) {
		return sqlSession.selectOne("shopMember.selectOne",memberId);
	}

	@Override
	public CouponInfo selectCouponInfoOne(String couponId) {
		return sqlSession.selectOne("shopMember.selectCouponInfoOne", couponId);
	}

	@Override
	public int insertCart(Cart cart) {
		return sqlSession.insert("shopMember.insertCart", cart);
	}

	@Override
	public List<Cart> selectCartList(String memberId) {
		return sqlSession.selectList("shopMember.selectCartList", memberId);
	}

	@Override
	public Cart selectCartOne(String cartId) {
		return sqlSession.selectOne("shopMember.selectCartOne", cartId);
	}

	@Override
	public int updateCartOne(Cart cart) {
		return sqlSession.update("shopMember.updateCartOne", cart);
	}

	@Override
	public int updateConsumerInfo(ShopMember sMem) {
		return sqlSession.update("shopMember.updateConsumerInfo", sMem);
	}

	@Override
	public int updateCoupon(Coupon coupon) {
		return sqlSession.update("shopMember.updateCoupon", coupon);
	}
}
