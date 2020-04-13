package kh.mclass.IgreMall.admin.question.model.dao;

import java.util.List;

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
}
