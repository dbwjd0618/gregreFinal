package kh.mclass.IgreMall.admin.orderList.model.service;

import java.util.List;

import kh.mclass.IgreMall.admin.orderList.model.vo.AdminOrderList;
import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.product.model.vo.Attachment;

public interface OrderListService {

	List<AdminOrderList> orderList(String sellerId);

	Attachment selectAttachOne(String productId);

	List<AdminOrderList> orderListSearch(AdminOrderList o);

	int totalOrders(AdminOrderList o);

	int deleteOrder(String orderNo);


	
	
}
