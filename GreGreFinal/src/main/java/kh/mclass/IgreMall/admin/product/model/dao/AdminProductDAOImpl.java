package kh.mclass.IgreMall.admin.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.product.model.vo.Attachment;
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

}
