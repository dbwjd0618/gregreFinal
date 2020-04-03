package kh.mclass.IgreMall.shopMember.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
