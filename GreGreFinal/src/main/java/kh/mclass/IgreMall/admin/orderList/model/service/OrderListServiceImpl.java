package kh.mclass.IgreMall.admin.orderList.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.orderList.model.dao.OrderListDAO;
import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.product.model.vo.Attachment;

@Service
public class OrderListServiceImpl implements OrderListService {
	@Autowired
	private OrderListDAO orderListDao;

	@Override
	public List<OrderList> orderList(String sellerId) {
		// TODO Auto-generated method stub
		return orderListDao.orederList(sellerId);
	}

	@Override
	public Attachment selectAttachOne(String productId) {
		// TODO Auto-generated method stub
		return orderListDao.selectAttachOne(productId);
	}

	@Override
	public List<OrderList> orderListSearch(OrderList o) {
		// TODO Auto-generated method stub
		return orderListDao.orderListSearch(o);
	}

	@Override
	public int totalOrders(OrderList o) {
		return orderListDao.totalOrders(o);
	}
}
