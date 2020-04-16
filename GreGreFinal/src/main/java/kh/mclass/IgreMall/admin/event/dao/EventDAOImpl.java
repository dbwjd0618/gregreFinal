package kh.mclass.IgreMall.admin.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.IgreMall.admin.event.vo.AttachmentEvent;
import kh.mclass.IgreMall.admin.event.vo.Event;
import kh.mclass.IgreMall.admin.event.vo.EventPost;
import kh.mclass.IgreMall.admin.event.vo.EventReply;

@Repository
public class EventDAOImpl implements EventDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public int insertEvent(Event event) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminEvent.insertEvent",event);
	}

	@Override
	public List<Event> eventList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminEvent.eventList");
	}

	@Override
	public Event selectList(Event e) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminEvent.selectEvent",e);
	}
	@Override
	public int postWrite(EventPost post) {
		return sqlSession.insert("adminEvent.postWrite", post);
	}

	@Override
	public int replyWrite(EventReply reply) {
		return sqlSession.insert("adminEvent.replyWrite", reply);
	}

	@Override
	public int countReply(Event e) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminEvent.countReply", e);
	}

	@Override
	public List<EventReply> selectReply(Event e) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminEvent.selectReply", e);
	}
	@Override
	public List<EventReply> selectDReply(Event e) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminEvent.selectDReply", e);
	}

	@Override
	public int insertEventImg(AttachmentEvent attach1) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminEvent.insertAttach", attach1);
	}


}
