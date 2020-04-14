package kh.mclass.IgreMall.admin.event.service;

import java.util.List;

import kh.mclass.IgreMall.admin.event.vo.Event;

public interface EventService {

	int insertEvent(Event e);

	List<Event> eventList();

	Event selectEvent(Event e);


	
	

}
