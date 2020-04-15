package kh.mclass.IgreMall.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.product.model.vo.ProductCount;

@Repository
public class ShopDAOImpl implements ShopDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Product> productList(int cPage, int numPerPage,Product cate3) {
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rbn = new RowBounds(offset, limit);

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

	@Override
	public List<Product> productListAll(Map<String, String> categories) {
		return sqlSession.selectList("product.productListAll",categories);
	}

	@Override
	public List<ProductCount> selectCountList(int cPage, int numPerPage) {
		int offset = (cPage-1)*numPerPage;
		int limit= numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("product.selectCountList",null, rowBounds);
	}

	@Override
	public List<Product> productListAll(int cPage, int numPerPage, Map<String, String> categories) {
		int offset = (cPage-1)*numPerPage;
		int limit= numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("product.productListAll",categories, rowBounds);
	}

	@Override
	public List<Product> searchListAll(int cPage, int numPerPage, Product product) {
		int offset = (cPage-1)*numPerPage;
		int limit= numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return sqlSession.selectList("product.searchListAll",product, rowBounds);
	}
	

}
