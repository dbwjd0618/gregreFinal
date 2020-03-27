package kh.mclass.IgreMall.shop.model.service;

import java.util.List;

import kh.mclass.IgreMall.product.model.vo.Product;

public interface ShopService {


	int selectTotalProducts();

	List<Product> productList(int cPage, int numPerPage, Product categoryId);

}
