package kh.mclass.IgreMall.event.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.event.vo.EventReply;
import kh.mclass.IgreMall.event.model.dao.ShopEventDAO;
import kh.mclass.IgreMall.event.model.vo.ShopEvent;

@Service
public class ShopEventServiceImpl implements ShopEventService {

	@Autowired
	ShopEventDAO shopEventDao;
	@Override
	public List<ShopEvent> selectList() {
		// TODO Auto-generated method stub
		return shopEventDao.selectList();
	}
	@Override
	public ShopEvent selectOne(int eventNo) {
		// TODO Auto-generated method stub
		return shopEventDao.selectOne(eventNo);
	}
	@Override
	public int replyWrite(EventReply reply) {
		// TODO Auto-generated method stub
		return shopEventDao.replyWrite(reply);
	}
	@Override
	public int countReply(int eventNo) {
		// TODO Auto-generated method stub
		return shopEventDao.countReply(eventNo);
	}
	@Override
	public List<EventReply> selectReply(int eventNo) {
		// TODO Auto-generated method stub
		return shopEventDao.selectReply(eventNo);
	}

}
