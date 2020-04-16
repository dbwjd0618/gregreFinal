package kh.mclass.IgreMall.admin.event.service;

import java.util.List;

import kh.mclass.IgreMall.admin.event.vo.AttachmentEvent;
import kh.mclass.IgreMall.admin.event.vo.Event;
import kh.mclass.IgreMall.admin.event.vo.EventReply;

public interface EventService {

	int insertEvent(Event e);

	List<Event> eventList();

	Event selectEvent(Event e);

	int replyWrite(EventReply reply);

	int countReply(Event e);

	List<EventReply> selectReply(Event e);
	List<EventReply> selectDReply(Event e);

	int insertEventImg(AttachmentEvent attach1);


	
	

}
