package kh.mclass.IgreMall.coupon.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.review.model.vo.ProdReview;

@Repository
public class CouponDAOImpl implements CouponDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Coupon> selectListMyCoupon(String memberId) {
		return sqlSession.selectList("shopMember.selectListMyCoupon",memberId);
	}

	

}
