package kh.mclass.IgreMall.admin.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.admin.review.model.vo.AdminProdReview;

@Repository
public class AdminReviewDAOImpl implements AdminReviewDAO {

	@Autowired
	SqlSession sqlSession;
	@Override
	public List<AdminProdReview> selectListReview() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminReview.list");
	}
	@Override
	public int deleteReview(String reviewId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminReview.deleteReivew",reviewId);
	}

}
