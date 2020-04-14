package kh.mclass.IgreMall.admin.event.dao;

import java.util.List;

import kh.mclass.IgreMall.admin.event.vo.AttachmentEvent;
import kh.mclass.IgreMall.admin.event.vo.Event;
import kh.mclass.IgreMall.admin.event.vo.EventPost;
import kh.mclass.IgreMall.admin.event.vo.EventReply;

public interface EventDAO {

	int insertEvent(Event e);

	List<Event> eventList();

	Event selectList(Event e);

	int replyWrite(EventReply reply);

	int postWrite(EventPost post);

	int countReply(Event e);

	List<EventReply> selectReply(Event e);

	int insertEventImg(AttachmentEvent attach1);

}
