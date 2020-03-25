package kh.mclass.IgreMall.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.Product;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void insert(List<Product> productList) {
		
		 for(Product product : productList) {
	            sqlSession.insert("product.insert",product);
		 }
		 
	}

	@Override
	public void insertAttachment(List<Attachment> attachList) {
		for(Attachment attach : attachList) {
			sqlSession.insert("product.insertAttachment", attach);
		}
	}
}
