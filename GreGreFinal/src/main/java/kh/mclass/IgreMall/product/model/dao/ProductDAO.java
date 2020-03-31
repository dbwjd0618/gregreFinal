package kh.mclass.IgreMall.product.model.dao;

import java.util.List;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface ProductDAO {

	void insert(List<Product> productList);

	void insertAttachment(List<Attachment> attachList);

	Product selectProductOne(String productId);

	List<Attachment> selectAttachList(String productId);

	List<ProdOption> selectOptionList(String productId);

	ProdOption selectOptionOne(String optionID);

}
