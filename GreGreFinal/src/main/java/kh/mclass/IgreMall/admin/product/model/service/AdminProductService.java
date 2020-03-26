package kh.mclass.IgreMall.admin.product.model.service;

import java.util.List;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface AdminProductService {


	int insertProduct(Product product, List<Attachment> attachList);


}
