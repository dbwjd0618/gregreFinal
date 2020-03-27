package kh.mclass.Igre.counselling.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CounselorDAOImpl implements CounselorDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectCounselorTotalContents() {
		return sqlSession.selectOne("counselor.selectCounselorTotalContents");
	}

	
}
