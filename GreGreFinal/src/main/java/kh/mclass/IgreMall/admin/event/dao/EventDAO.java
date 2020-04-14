package kh.mclass.IgreMall.admin.event.dao;

import java.util.List;

import kh.mclass.IgreMall.admin.event.vo.Event;

public interface EventDAO {

	int insertEvent(Event e);

	List<Event> eventList();

	Event selectList(Event e);

}
