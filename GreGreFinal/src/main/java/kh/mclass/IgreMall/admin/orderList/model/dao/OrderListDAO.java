package kh.mclass.IgreMall.admin.orderList.model.dao;

import java.util.List;

import kh.mclass.IgreMall.admin.orderList.model.vo.AdminOrderList;
import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.product.model.vo.Attachment;

public interface OrderListDAO {

	List<AdminOrderList> orederList(String sellerId);

	Attachment selectAttachOne(String productId);

	List<AdminOrderList> orderListSearch(AdminOrderList o);

	int totalOrders(AdminOrderList o);

	int deleteOrder(String orderNo);

}
