package kh.mclass.IgreMall.admin.question.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.admin.question.model.vo.AdminQnA;

@Repository

public class ShopAdminQuestionDAOImpl implements ShopAdminQuestionDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<AdminQnA> QnAlist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminQnA.list"); 
	}

	@Override
	public AdminQnA selectQnA(String qaId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminQnA.selectQA",qaId);
	}

	@Override
	public int answer(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminQnA.insertAnswer",map);
	}

	@Override
	public int updateStatus(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminQnA.updateStatus",map);
	}

	@Override
	public int totalcount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminQnA.totalCount");
	}

	@Override
	public int nTotalcount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminQnA.nTotalCount");
	}

	@Override
	public int yTotalcount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminQnA.yTotalCount");
	}
}
