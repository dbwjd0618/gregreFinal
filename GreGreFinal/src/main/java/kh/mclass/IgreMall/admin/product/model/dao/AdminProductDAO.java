package kh.mclass.IgreMall.admin.product.model.dao;

import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface AdminProductDAO {



	int insertProduct(Product product);

	int insertAttach(Attachment attach);

	int insertProdOption(ProdOption prodOption);

}
