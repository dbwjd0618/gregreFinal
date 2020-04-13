package kh.mclass.IgreMall.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<Product> productList(int cPage,int numPerPage,Product productId) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rbn = new RowBounds(offset, limit);
		return sqlSession.selectList("adminProduct.productList", productId,rbn);
	}
	@Override
	public int updateProduct(Product p) {
		return sqlSession.update("adminProduct.updateProduct",p);
	}
	@Override
	public int deleteProduct(Product p) {
		return sqlSession.delete("adminProduct.deleteProduct", p);
	}
	@Override
	public int totalPrice(Product productId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminProduct.totalProduct",productId);
	}
	@Override
	public List<Map<String, Object>> searchProduct(Map<String, Object> time) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminProduct.searchProduct",time);
	}
	@Override
	public List<Product> searchProduct(Product p) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminProduct.searchProduct",p);
	}
	@Override
	public List<Product> productListSeller(Product p) {
		return sqlSession.selectList("adminProduct.productListSeller", p);
	}
	@Override
	public Product productEdit(String productId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminProduct.productEdit", productId);
	}
	@Override
	public List<ProdOption> productOption(String productId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminProduct.productOption", productId);
	}
	@Override
	public int editProduct(Product product) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminProduct.editProduct", product);
	}
	@Override
	public int editAttach(Attachment attach) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminProduct.editAttach", attach);
	}
	@Override
	public int editProdOption(ProdOption prodOption) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminProduct.editProdOption", prodOption);
	}
}
