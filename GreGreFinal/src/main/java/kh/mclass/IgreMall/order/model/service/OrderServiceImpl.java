package kh.mclass.IgreMall.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.product.model.exception.ProductException;
import kh.mclass.IgreMall.order.model.dao.OrderDAO;
import kh.mclass.IgreMall.order.model.exception.OrderException;
import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.order.model.vo.OrderProduct;
import kh.mclass.IgreMall.order.model.vo.PayAccountInfo;
import kh.mclass.IgreMall.order.model.vo.PaymentInfo;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	

	@Override
	public int insertOrder(OrderList orderList, List<OrderProduct> orderProdList, PaymentInfo paymentInfo) {
		int result = 0;
		//1. orderlist테이블에 insert
		result = orderDAO.insertOrderList(orderList);
		System.out.println("orderNO"+orderList.getOrderNo());
		if(result== 0)
			throw new OrderException("주문 정보 등록 오류!");
		//2. order_prod 테이블에 insert
		for(OrderProduct orderProd : orderProdList) {
			orderProd.setOrderNo(orderList.getOrderNo());
			result = orderDAO.inserOrderProd(orderProd);
			if(result== 0)
				throw new OrderException("주문 상품 등록 오류");
		}
		
		//PropductOptionInsert
		paymentInfo.setOrderNo(orderList.getOrderNo());
		result = orderDAO.insertPaymentInfo(paymentInfo);
		if(result== 0)
			throw new OrderException("결제정보 등록 오류");
	
		
		return result;
	}


	@Override
	public int insertPayAccInfo(PayAccountInfo payAccInfo) {
		int result = 0;
		
		result = orderDAO.insertPayAccInfo(payAccInfo);
		
		return result;
	}


	@Override
	public OrderList selectOrderList(String orderNo) {
		
		OrderList orderList = orderDAO.selectOrderList(orderNo);
		return orderList;
	}


	@Override
	public List<OrderProduct> selectOrderProdList(String orderNo) {
		List<OrderProduct> orderProdList = orderDAO.selectOrderProdList(orderNo);
		return orderProdList;
	}


	@Override
	public PayAccountInfo selectPayAccInfo(String orderNo) {
		PayAccountInfo payAccInfo = orderDAO.selectPayAccInfo(orderNo);
		return payAccInfo;
	}


	@Override
	public PaymentInfo selectPaymentInfo(String orderNo) {
		PaymentInfo paymentInfo = orderDAO.selectPaymentInfo(orderNo);
		return paymentInfo;
	}


	@Override
	public List<OrderList> selectListOrder(String memberId) {
		List<OrderList> orderList = orderDAO.selectListOrder(memberId);
		return orderList;
	}
}
