package kh.mclass.IgreMall.event.model.dao;

import java.util.List;

import kh.mclass.IgreMall.admin.event.vo.EventReply;
import kh.mclass.IgreMall.event.model.vo.ShopEvent;
import kh.mclass.IgreMall.event.model.vo.Winner;

public interface ShopEventDAO {

	List<ShopEvent> selectList();

	ShopEvent selectOne(int eventNo);

	int replyWrite(EventReply reply);

	int countReply(int eventNo);

	List<EventReply> selectReply(int eventNo);

	List<Winner> selectWinner();

	List<Winner> selectWinner(int eventNo);

}
