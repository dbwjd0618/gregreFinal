package kh.mclass.IgreMall.wish.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.coupon.model.vo.CouponInfo;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.shopMember.model.vo.ShopMember;
import kh.mclass.IgreMall.wish.model.vo.Wish;

@Repository
public class WishDAOImpl implements WishDAO{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Wish selectWishOne(Wish wish) {
	
		return sqlSession.selectOne("wish.selectWishOne", wish);
	}

	@Override
	public int updateWishCheck(Wish wish) {
		return sqlSession.update("wish.updateWishCheck", wish);
	}

	@Override
	public int insertWish(Wish wish) {
		return sqlSession.update("wish.insertWish", wish);
	}

	@Override
	public List<Wish> selectWishList(String memberId) {
		return sqlSession.selectList("wish.selectWishList", memberId);
	}

	
}
