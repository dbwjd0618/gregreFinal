package kh.mclass.IgreMall.admin.product.model.service;

import java.util.List;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface AdminProductService {


	int insertProduct(Product product, List<Attachment> attachList, List<ProdOption> prodOptionList);

	List<Product> productList(Product productId);


}
