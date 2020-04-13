package kh.mclass.IgreMall.QnA.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.QnA.model.dao.ProdQnADAO;
import kh.mclass.IgreMall.QnA.model.vo.ProdQnA;

@Service
public class ProdQnAServiceImpl implements ProdQnAService {
	
	@Autowired
	ProdQnADAO prodQnADAO;

	@Override
	public int insertQnA(ProdQnA prodQnA) {
	
		return prodQnADAO.insertQnA(prodQnA);
	}

	@Override
	public List<ProdQnA> selectListQnA(String productId) {
		return prodQnADAO.selectListQnA(productId);
	}

	@Override
	public List<ProdQnA> selectListMyQnA(String memberId) {
		return prodQnADAO.selectListMyQnA(memberId);
	}

	@Override
	public int updateQnA(ProdQnA prodQnA) {
		return prodQnADAO.updateQnA(prodQnA);
	}

	@Override
	public int deleteQnA(String qaId) {
		return prodQnADAO.deleteQnA(qaId);
	}



	

	




}
