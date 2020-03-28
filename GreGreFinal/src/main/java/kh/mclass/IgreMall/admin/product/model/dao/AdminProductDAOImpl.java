package kh.mclass.IgreMall.admin.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

@Repository
public class AdminProductDAOImpl implements AdminProductDAO{
	@Autowired
	SqlSessionTemplate sqlSession;


	@Override
	public int insertProduct(Product product) {
		return sqlSession.insert("adminProduct.insertProduct", product);
	}

	@Override
	public int insertAttach(Attachment attach) {
		return sqlSession.insert("adminProduct.insertAttach", attach);
	}


	@Override
	public int insertProdOption(ProdOption prodOption) {
		return  sqlSession.insert("adminProduct.insertProdOption", prodOption);
	}

	@Override
	public List<Product> productList(Product productId) {
		return sqlSession.selectList("adminProduct.productList", productId);
	}

}
