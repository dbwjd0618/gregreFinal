package kh.mclass.IgreMall.admin.orderList.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.admin.orderList.model.vo.AdminOrderList;
import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.product.model.vo.Attachment;

@Repository
public class OrderListDAOImpl implements OrderListDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<AdminOrderList> orederList(String sellerId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminOrder.selectList",sellerId);
	}

	@Override
	public Attachment selectAttachOne(String productId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminOrder.selectList",productId);
	}

	@Override
	public List<AdminOrderList> orderListSearch(AdminOrderList o) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminOrder.searchList",o);
	}

	@Override
	public int totalOrders(AdminOrderList o) {
		return sqlSession.selectOne("adminOrder.totalOrders",o);
	}

	@Override
	public int deleteOrder(String orderNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminOrder.deleteOrders",orderNo);
	}
}
