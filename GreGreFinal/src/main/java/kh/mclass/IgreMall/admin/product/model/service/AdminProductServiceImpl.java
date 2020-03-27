package kh.mclass.IgreMall.admin.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.product.model.dao.AdminProductDAO;
import kh.mclass.IgreMall.admin.product.model.exception.ProductException;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;

@Service
public class AdminProductServiceImpl implements AdminProductService{
	@Autowired
	private AdminProductDAO adminProductDAO;


	@Override
	public int insertProduct(Product product,List<Attachment> attachList, List<ProdOption> prodOptionList) {
		int result = 0;
		//1. Board테이블에 insert
		result = adminProductDAO.insertProduct(product);
		
		if(result== 0)
			throw new ProductException("게시글 등록 오류!");
		//2. Attachment테이블에 insert
		for(Attachment attach : attachList) {
			result = adminProductDAO.insertAttach(attach);
			if(result== 0)
				throw new ProductException("첨부파일 등록 오류");
		}
		
		//PropductOptionInsert
		for(ProdOption prodOption : prodOptionList) {
			result = adminProductDAO.insertProdOption(prodOption);
			if(result== 0)
				throw new ProductException("옵션 등록 오류");
		}
		
		return result;
	}


}