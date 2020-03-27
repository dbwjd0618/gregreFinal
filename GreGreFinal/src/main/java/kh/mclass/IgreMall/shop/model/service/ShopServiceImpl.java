package kh.mclass.IgreMall.shop.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.shop.model.dao.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopDAO shopDAO;

	@Override
	public int selectTotalProducts() {
		return shopDAO.selectTotalProducts();
	}




	@Override
	public List<Product> productList(int cPage, int numPerPage,Product categoryId) {
		return shopDAO.productList(cPage,numPerPage,categoryId);
	}


}
