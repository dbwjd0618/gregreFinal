package kh.mclass.IgreMall.admin.product.model.service;

import java.util.List;
import java.util.Map;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface AdminProductService {


	int insertProduct(Product product, List<Attachment> attachList, List<ProdOption> prodOptionList);

	List<Product> productList(int cPage,int numPerPage,Product productId) ;

	int updateProduct(Product p);

	int deleteProduct(Product p);

	List<Map<String, Object>> searchProduct(Map<String, Object> time);

	int totalProducts(Product productId);

	List<Product> searchProduct(Product p);

	List<Product> productListSeller(Product p);

	Product productEdit(String productId);

	List<ProdOption> productOption(String productId);

	int editProduct(Product product, List<Attachment> attachList, List<ProdOption> prodOptionList);

}
