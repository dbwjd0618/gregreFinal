package kh.mclass.IgreMall.shop.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Product;

@Repository
public class ShopDAOImpl implements ShopDAO {
	@Autowired
	SqlSessionTemplate sqlSession;


	@Override
	public List<Product> productList(int cPage, int numPerPage,Product cate3) {
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rbn = new RowBounds(offset, limit);
		
		System.out.println("category3@DAO"+cate3);
		return sqlSession.selectList("product.productList",cate3,rbn);
	}

	@Override
	public int selectTotalProducts(Product cate3) {
		return sqlSession.selectOne("product.selectTotalProducts",cate3);
	}



	@Override
	public List<Product> productList(Product category1Prod) {
		return sqlSession.selectList("product.productList",category1Prod);
	}




}
