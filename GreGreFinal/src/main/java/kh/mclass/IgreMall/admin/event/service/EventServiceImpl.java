package kh.mclass.IgreMall.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.IgreMall.admin.event.dao.EventDAO;
import kh.mclass.IgreMall.admin.event.vo.AttachmentEvent;
import kh.mclass.IgreMall.admin.event.vo.Event;
import kh.mclass.IgreMall.admin.event.vo.EventReply;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDao;

	@Override
	public int insertEvent(Event e) {
		// TODO Auto-generated method stub
		return eventDao.insertEvent(e);
	}

	@Override
	public List<Event> eventList() {
		// TODO Auto-generated method stub
		return  eventDao.eventList();
	}

	@Override
	public Event selectEvent(Event e) {
		// TODO Auto-generated method stub
		return eventDao.selectList(e);
	}

	@Override
	public int replyWrite(EventReply reply) {
		return eventDao.replyWrite(reply);
	}

	@Override
	public int countReply(Event e) {
		// TODO Auto-generated method stub
		return eventDao.countReply(e);
	}

	@Override
	public List<EventReply> selectReply(Event e) {
		// TODO Auto-generated method stub
		return eventDao.selectReply(e);
	}

	@Override
	public int insertEventImg(AttachmentEvent attach1) {
		// TODO Auto-generated method stub
		return eventDao.insertEventImg(attach1);
	}

	
}
