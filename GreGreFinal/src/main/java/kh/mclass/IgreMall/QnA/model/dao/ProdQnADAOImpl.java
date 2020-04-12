package kh.mclass.IgreMall.QnA.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.QnA.model.vo.ProdQnA;
import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.review.model.vo.ProdReview;

@Repository
public class ProdQnADAOImpl implements ProdQnADAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertQnA(ProdQnA prodQnA) {
	
		return sqlSession.insert("prodQnA.insertQnA",prodQnA);
	}

	@Override
	public List<ProdQnA> selectListQnA(String productId) {
		return sqlSession.selectList("prodQnA.selectListQnA",productId);
	}

	@Override
	public List<ProdQnA> selectListMyQnA(String memberId) {
		return sqlSession.selectList("prodQnA.selectListMyQnA",memberId);
	}

	@Override
	public int updateQnA(ProdQnA prodQnA) {
		return sqlSession.update("prodQnA.updateQnA",prodQnA);
	}

	@Override
	public int deleteQnA(String qaId) {
		return sqlSession.delete("prodQnA.deleteQnA",qaId);
	}

	

	

}
