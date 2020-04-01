package kh.mclass.IgreMall.admin.product.model.dao;

import java.util.List;
import java.util.Map;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface AdminProductDAO {



	int insertProduct(Product product);

	int insertAttach(Attachment attach);

	int insertProdOption(ProdOption prodOption);

	List<Product> productList(Product productId);

	int updateProduct(Product p);

	int deleteProduct(Product p);

	List<Map<String, Object>> searchProduct(Map<String, Object> time);

	int totalPrice(Product productId);

	List<Product> searchProduct(Product p);

	List<Product> productListSeller(Product p);


}
