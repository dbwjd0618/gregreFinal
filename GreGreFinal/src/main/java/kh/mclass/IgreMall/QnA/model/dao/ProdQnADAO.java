package kh.mclass.IgreMall.QnA.model.dao;

import java.util.List;

import kh.mclass.IgreMall.QnA.model.vo.ProdQnA;
import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.review.model.vo.ProdReview;

public interface ProdQnADAO {

	int insertQnA(ProdQnA prodQnA);

	List<ProdQnA> selectListQnA(String productId);

	List<ProdQnA> selectListMyQnA(String memberId);

	int updateQnA(ProdQnA prodQnA);

	int deleteQnA(String qaId);





}
