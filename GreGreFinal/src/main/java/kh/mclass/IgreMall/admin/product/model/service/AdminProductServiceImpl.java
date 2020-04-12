package kh.mclass.IgreMall.admin.product.model.service;

import java.util.List;
import java.util.Map;

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
		System.out.println("result= 등록"+result);
		if(result== 0)
			throw new ProductException("첨부파일등록 오류!");
		//2. Attachment테이블에 insert
		for(Attachment attach : attachList) {
			attach.setProductId(product.getProductId());
			System.out.println("product.getProductId111"+product.getProductId());
			result = adminProductDAO.insertAttach(attach);
			if(result== 0)
				throw new ProductException("첨부파일 등록 오류");
		}
		
		//PropductOptionInsert
		if(prodOptionList != null) {
			for(ProdOption prodOption : prodOptionList) {
				System.out.println("product.getProductId222"+product.getProductId());
				prodOption.setProductId(product.getProductId());
				result = adminProductDAO.insertProdOption(prodOption);
				if(result== 0)
					throw new ProductException("옵션 등록 오류");
			}
			
		}
		
		return result;
	}


	@Override
	public List<Product> productList(int cPage,int numPerPage,Product productId) {
		return adminProductDAO.productList(cPage,numPerPage,productId);
	}


	@Override
	public int updateProduct(Product p) {
		return adminProductDAO.updateProduct (p);
	}


	@Override
	public int deleteProduct(Product p) {
		// TODO Auto-generated method stub
		return adminProductDAO.deleteProduct(p);
	}




	@Override
	public int totalProducts(Product productId) {
		// TODO Auto-generated method stub
		return adminProductDAO.totalPrice(productId);
	}


	@Override
	public List<Map<String, Object>> searchProduct(Map<String, Object> time) {
		// TODO Auto-generated method stub
		return adminProductDAO.searchProduct(time);
	}


	@Override
	public List<Product> searchProduct(Product p) {
		return adminProductDAO.searchProduct(p);
	}


	@Override
	public List<Product> productListSeller(Product p) {
		return adminProductDAO.productListSeller(p);
	}


	@Override
	public Product productEdit(String productId) {
		// TODO Auto-generated method stub
		return adminProductDAO.productEdit(productId);
	}


	@Override
	public List<ProdOption> productOption(String productId) {
		// TODO Auto-generated method stub
		return adminProductDAO.productOption(productId);
	}

	

	@Override
	public int editProduct(Product product, List<Attachment> attachList, List<ProdOption> prodOptionList) {
		int result = 0;
		//1. Board테이블에 insert
		result = adminProductDAO.editProduct(product);
		System.out.println("edit= 수정"+result);
		if(result== 0)
			throw new ProductException("첨부파일등록 오류!");
		//2. Attachment테이블에 insert
		for(Attachment attach : attachList) {
			attach.setProductId(product.getProductId());
			System.out.println("product.getProductId111"+product.getProductId());
			result = adminProductDAO.editAttach(attach);
			if(result== 0)
				throw new ProductException("첨부파일 수정 오류");
		}
		
		//PropductOptionInsert
		if(prodOptionList != null) {
			for(ProdOption prodOption : prodOptionList) {
				System.out.println("product.getProductId222"+product.getProductId());
				prodOption.setProductId(product.getProductId());
				result = adminProductDAO.editProdOption(prodOption);
				if(result== 0)
					throw new ProductException("옵션 수정 오류");
			}
			
		}
		
		return result;
	}






}
