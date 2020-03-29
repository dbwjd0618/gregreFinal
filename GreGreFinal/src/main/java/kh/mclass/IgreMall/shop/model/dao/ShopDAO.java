package kh.mclass.IgreMall.shop.model.dao;

import java.util.List;

import kh.mclass.IgreMall.product.model.vo.Product;

public interface ShopDAO {


	int selectTotalProducts(Product cate3);

	List<Product> productList(int cPage, int numPerPage, Product categoryId);

	List<Product> productList(Product category1Prod);



}
