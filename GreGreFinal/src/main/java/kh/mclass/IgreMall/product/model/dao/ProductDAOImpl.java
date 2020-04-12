package kh.mclass.IgreMall.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void insert(List<Product> productList) {
		
		 for(Product product : productList) {
	            sqlSession.insert("product.insertProduct",product);
		 }
		 
	}

	@Override
	public void insertAttachment(List<Attachment> attachList) {
		for(Attachment attach : attachList) {
			sqlSession.insert("product.insertAttachment", attach);
		}
	}

	@Override
	public Product selectProductOne(String productId) {
		return sqlSession.selectOne("product.selectProductOne",productId);
	}

	@Override
	public List<Attachment> selectAttachList(String productId) {
		return sqlSession.selectList("product.selectAttachList",productId);
	}

	@Override
	public List<ProdOption> selectOptionList(String productId) {
		return sqlSession.selectList("product.selectOptionList",productId);
	}

	@Override
	public ProdOption selectOptionOne(String optionId) {
		return sqlSession.selectOne("product.selectOptionOne",optionId);
	}

	@Override
	public String selectSellerId(String productId) {
		return sqlSession.selectOne("product.selectSellerId", productId);
	}

	@Override
	public Object insertProduct(Product product) {
		return sqlSession.insert("product.insertProduct", product);
	}
}
