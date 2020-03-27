package kh.mclass.Igre.counselling.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.counselling.model.vo.Counselor;

@Repository
public class CounselorDAOImpl implements CounselorDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectCounselorTotalContents() {
		return sqlSession.selectOne("counselor.selectCounselorTotalContents");
	}

	@Override
	public List<Counselor> selectCounselorList(int cPage, int numPerPage) {
		
		int offset = (cPage-1)*numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("counselor.selectCounselorList", null, rowBounds);
	}

	@Override
	public Counselor selectOne(String advisId) {
		
		return sqlSession.selectOne("counselor.selectOne", advisId);
	}

	
}
