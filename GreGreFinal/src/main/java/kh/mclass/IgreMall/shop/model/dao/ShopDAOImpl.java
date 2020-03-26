package kh.mclass.IgreMall.shop.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Product;

@Repository
public class ShopDAOImpl implements ShopDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int selectTotalProducts() {
		return sqlSession.selectOne("product.selectTotalProducts");
	}

	@Override
	public List<Product> productList(int cPage, int numPerPage,Product cate3) {
		// TODO Auto-generated method stub
		System.out.println("category3@DAO"+cate3);
		return sqlSession.selectList("product.productList",cate3);
	}

	
}
