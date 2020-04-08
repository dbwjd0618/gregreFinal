package kh.mclass.IgreMall.admin.event.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {
	@Autowired
	SqlSession sqlSession;
	

}
