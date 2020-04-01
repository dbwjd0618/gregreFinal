package kh.mclass.IgreMall.admin.orderList.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.orderList.model.service.OrderListService;
import kh.mclass.IgreMall.order.model.vo.OrderList;
import kh.mclass.IgreMall.product.model.vo.Product;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/shop/admin/order")
@Slf4j
public class OrderListController {
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@Autowired
	OrderListService orderListService;
	
	@RequestMapping("/search.do")
	public ModelAndView searchProduct(ModelAndView mav,
			@RequestParam(value = "deliveryState", required = false) String deliveryState,
			@RequestParam(value = "productName", defaultValue="") String productName,
			@RequestParam(value = "payState", required = false) String payState,
			@RequestParam(value = "startDate", defaultValue = "1992-04-14") Date startDate,
			@RequestParam(value = "endDate", defaultValue = "1994-04-7") Date endDate,
			@RequestParam(value = "payMethod", required = true) String payMethod) {

		log.debug("주문조회서치를 시작합니다.");
		// 진희
		if (endDate.equals(java.sql.Date.valueOf("1994-04-07"))) {
			endDate = new Date(new java.util.Date().getTime());
		}
		
		OrderList o = new OrderList();
		o.setDeliveryState(deliveryState);
		o.setPayState(payState);
		o.setPayMethod(payMethod);
		/*
		 * Product p = new Product(); 
		 * p.setSellerId(sellerId);
		 * p.setProductName(productName);
		 *  p.setProductState(productState);
		 */
		List<OrderList> allOrderList = orderListService.orderListSearch(o);
		List<OrderList> list = new ArrayList<>();
		int totalOrders = orderListService.totalOrders(o);

		for (int i = 0; i < allOrderList.size(); i++) {
			if (!startDate.after(allOrderList.get(i).getOrderDate())
					&& !endDate.before(allOrderList.get(i).getOrderDate())) {
				list.add(allOrderList.get(i));
			}
		}
		
		log.debug("list" + list);
		// 자료형 확인하는 공간
		// 제품 갯수 구하기
		mav.addObject("totalOrders", totalOrders);
//		log.debug("searchList={}",list);
		mav.addObject("list", list);
		mav.setViewName("shop/admin/order/orderList");

		return mav;
	}
	

	@GetMapping("/orderList.do")
	public ModelAndView orderList(ModelAndView mav,String sellerId) {
		log.debug("오더리스트들어가기");
		String ellerId= "ekfcjd2";
		
		List<OrderList> list = orderListService.orderList(sellerId);
		/*List<Attachment> attachList = new ArrayList<>();
		for (int i=0;i<list.size();i++) {
			Attachment a = orderListService.selectAttachOne(list.get(i).getProductId());
			attachList.add(a);
		}			*/
		OrderList o = new OrderList();
		int totalOrders = orderListService.totalOrders(o);
		mav.addObject("totalOrders", totalOrders);
		mav.addObject("list",list);
//		mav.addObject("attachList",attachList);
		mav.setViewName("shop/admin/order/orderList");
		return mav;
	}
	
}
	
