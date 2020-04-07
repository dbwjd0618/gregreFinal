package kh.mclass.IgreMall.admin.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.event.dao.EventDAO;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDAO eventDao;
	
}
