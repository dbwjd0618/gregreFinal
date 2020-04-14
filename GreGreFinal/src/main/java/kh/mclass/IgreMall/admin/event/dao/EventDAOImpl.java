package kh.mclass.IgreMall.admin.event.dao;

import java.util.List;

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

	@Override
	public List<Event> eventList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminEvent.eventList");
	}

	@Override
	public Event selectList(Event e) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminEvent.selectList",e);
	}
	

}
