package kh.mclass.IgreMall.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.event.dao.EventDAO;
import kh.mclass.IgreMall.admin.event.vo.Event;

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
	
}
