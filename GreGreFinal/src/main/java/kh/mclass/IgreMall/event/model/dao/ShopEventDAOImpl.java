package kh.mclass.IgreMall.event.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.admin.event.vo.EventReply;
import kh.mclass.IgreMall.event.model.vo.ShopEvent;

@Repository
public class ShopEventDAOImpl implements ShopEventDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ShopEvent> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shopEvent.selectList");
	}

	@Override
	public ShopEvent selectOne(int eventNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopEvent.selectOne",eventNo);
	}

	@Override
	public int replyWrite(EventReply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("shopEvent.replyWrite",reply);
	}

	@Override
	public int countReply(int eventNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopEvent.countReply",eventNo);
	}

	@Override
	public List<EventReply> selectReply(int eventNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("shopEvent.selectReply",eventNo);
	}

}
