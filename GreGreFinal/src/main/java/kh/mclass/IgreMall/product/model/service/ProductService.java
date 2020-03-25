package kh.mclass.IgreMall.product.model.service;

import java.util.List;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface ProductService {

	void insert(List<Product> productList);


	void insertAttach(List<Attachment> attachList);

}
