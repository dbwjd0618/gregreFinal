package kh.mclass.IgreMall.admin.event.service;

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
	
}
