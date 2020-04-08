package kh.mclass.IgreMall.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.order.model.vo.OrderProduct;
import kh.mclass.IgreMall.order.model.vo.PayAccountInfo;
import kh.mclass.IgreMall.order.model.vo.PaymentInfo;

@Repository
public class OrderDAOImpl implements OrderDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertOrderList(OrderList orderList) {
		
		return sqlSession.insert("shopOrder.insertOrderList",orderList);
	}

	@Override
	public int inserOrderProd(OrderProduct orderProd) {
		return sqlSession.insert("shopOrder.insertOrderProd",orderProd);
	}

	@Override
	public int insertPaymentInfo(PaymentInfo paymentInfo) {
		return sqlSession.insert("shopOrder.insertPaymentInfo", paymentInfo);
	}

	@Override
	public int insertPayAccInfo(PayAccountInfo payAccInfo) {
		return sqlSession.insert("shopOrder.insertPayAccInfo", payAccInfo);
	}

	@Override
	public OrderList selectOrderList(String orderNo) {
		return sqlSession.selectOne("shopOrder.selectOrderList", orderNo);
	}

	@Override
	public List<OrderProduct> selectOrderProdList(String orderNo) {
		return sqlSession.selectList("shopOrder.selectOrderProdList", orderNo);
	}

	@Override
	public PayAccountInfo selectPayAccInfo(String orderNo) {
		return sqlSession.selectOne("shopOrder.selectPayAccInfo", orderNo);
	}

	@Override
	public PaymentInfo selectPaymentInfo(String orderNo) {
		return sqlSession.selectOne("shopOrder.selectPaymentInfo", orderNo);
	}

	@Override
	public List<OrderList> selectListOrder(String memberId) {
		return sqlSession.selectList("shopOrder.selectListOrder", memberId);
	}
}
