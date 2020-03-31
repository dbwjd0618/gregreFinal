package kh.mclass.IgreMall.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.order.model.dao.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
}
