package kh.mclass.IgreMall.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.product.model.dao.ProductDAO;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO productDAO;
	@Override
	public void insert(List<Product> productList) {
		// TODO Auto-generated method stub
		productDAO.insert(productList);

		
	}

	@Override
	public void insertAttach(List<Attachment> attachList) {
		productDAO.insertAttachment(attachList);
		
	}

}
