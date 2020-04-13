package kh.mclass.IgreMall.admin.event.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.admin.event.vo.Event;

@Repository
public class EventDAOImpl implements EventDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertEvent(Event e) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminEvent.insertEvent",e);
	}
	

}
