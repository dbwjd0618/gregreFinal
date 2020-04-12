package kh.mclass.IgreMall.shop.model.service;

import java.util.List;
import java.util.Map;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.product.model.vo.ProductCount;

public interface ShopService {


	int selectTotalProducts(Product cate3);

	List<Product> productList(int cPage, int numPerPage, Product categoryId);


	List<Product> productList(Product category1Prod);

	List<ProductCount> selectCountList(int cPage, int numPerPage);

	List<Product> productListAll(int cPage, int numPerPage, Map<String, String> categories);


}
