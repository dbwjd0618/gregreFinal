package kh.mclass.IgreMall.admin.orderList.model.service;

import java.util.List;

import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.Product;

public interface OrderListService {

	List<OrderList> orderList(String sellerId);

	Attachment selectAttachOne(String productId);

	List<OrderList> orderListSearch(OrderList o);

	int totalOrders(OrderList o);

	
	
}
