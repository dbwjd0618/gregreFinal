package kh.mclass.IgreMall.product.model.service;

import java.util.List;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface ProductService {

	void insert(List<Product> productList);


	void insertAttach(List<Attachment> attachList);


	Product selectProductOne(String productId);


	List<Attachment> selectAttachList(String productId);


	List<ProdOption> selectOptionList(String productId);


	ProdOption selectOptionOne(String optionId);


	String selectSellerId(String productId);


	void insertProduct(Product p);


	int updateOption(ProdOption option);


	int updateProduct(Product product);


	List<Product> selectRecoProdList();

}
