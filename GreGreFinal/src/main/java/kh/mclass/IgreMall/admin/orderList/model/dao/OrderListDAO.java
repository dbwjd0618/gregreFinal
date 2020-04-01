package kh.mclass.IgreMall.admin.orderList.model.dao;

import java.util.List;

import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.product.model.vo.Attachment;

public interface OrderListDAO {

	List<OrderList> orederList(String sellerId);

	Attachment selectAttachOne(String productId);

	List<OrderList> orderListSearch(OrderList o);

	int totalOrders(OrderList o);

}
