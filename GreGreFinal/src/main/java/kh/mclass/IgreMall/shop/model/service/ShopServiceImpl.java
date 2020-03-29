package kh.mclass.IgreMall.shop.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.shop.model.dao.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {
		//	testpush
	@Autowired
	ShopDAO shopDAO;

	@Override
	public List<Product> productList(int cPage, int numPerPage,Product categoryId) {
		return shopDAO.productList(cPage,numPerPage,categoryId);
	}

	@Override
	public int selectTotalProducts(Product cate3) {
		return shopDAO.selectTotalProducts(cate3);
	}



	@Override
	public List<Product> productList(Product category1Prod) {
		return shopDAO.productList(category1Prod);
	}

	




}
