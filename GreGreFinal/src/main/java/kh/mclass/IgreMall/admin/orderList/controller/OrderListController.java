package kh.mclass.IgreMall.admin.orderList.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
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
import kh.mclass.IgreMall.order.model.vo.Attachment2;
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
			@RequestParam(value = "productName", defaultValue = "") String productName,
			@RequestParam(value = "payState", required = false) String payState,
			@RequestParam(value = "startDate", defaultValue = "1992-04-14") Date startDate,
			@RequestParam(value = "endDate", defaultValue = "1994-04-07") Date endDate,
			@RequestParam(value = "ostatus",defaultValue="") String ostatus,
			@RequestParam(value = "payMethod", required = true) String payMethod) {
		
		
		String[] orderStatus= null;//--주문상태(입금대기A, 결제완료B, 배송준비C, 배송중D, 배송완료E)
	//검색 필요한 사항들 -> 날짜, 결제방식, 주문상태, 상품명, 입금확인.

		OrderList o = new OrderList();
		o.setPayState(payState);
		o.setPayMethod(payMethod);
		o.setProductName(productName);
		
//		o.setDeliveryState(ostatus);
		
		List<OrderList> allOrderList = new ArrayList<OrderList>();
		//전체 다 뽑아내는 것이야..
		allOrderList = orderListService.orderListSearch(o);
		
		
		
		System.out.println(allOrderList);
		//A,B,.....
		orderStatus = ostatus.split(",");
		//대입되어야하는 list 
		List<OrderList> list=new ArrayList<OrderList>();
//		orderStatusList
	
		if (endDate.equals(java.sql.Date.valueOf("1994-04-07"))) {
			endDate = new Date(new java.util.Date().getTime());
		}
		
		for(int i=0;i<allOrderList.size();i++) {
			String state = allOrderList.get(i).getDeliveryState();
			//날짜가 들어왔을떄
			if (!startDate.after(allOrderList.get(i).getOrderDate())
					&& !endDate.before(allOrderList.get(i).getOrderDate())) {
				//A,B,C와 같은 값이 없을경우
				if("".equals(orderStatus[0])) {
					list.add(allOrderList.get(i));					
				}
				//있을 경우
				else {
					for(int j =0; j<orderStatus.length;j++) {
						//A,B가 state와 같을 경우
						if(orderStatus[j].equals(state)) {
							list.add(allOrderList.get(i));
						}
					}
				}
			}
				
		}
		System.out.println("여기에서 찍혀줘야해 아래것임");
		System.out.println("하하하한"+allOrderList.get(0).getAttachList().get(0).getProductName());
		
	
//		for (int i = 0; i < allOrderList.size(); i++) {
//			if (!startDate.after(allOrderList.get(i).getOrderDate())
//					&& !endDate.before(allOrderList.get(i).getOrderDate())) {
//					if(!list.contains(allOrderList.get(i))) {
//						list.add(allOrderList.get(i));
//					}
//			}
//		}
			
//		시퀀스 => 모든 리스트를 뽑아낸다.
//				1)if 문을 들어가서 해당 리스트틀 넣는다.
//				2)if 문을 들어가서 해당 리스트를 넣는다.1()
//				3)if 문을 들어가서 해당 리스트를 넣는다.2()
		
		
		
		
		
		
//		///주문 상태에대해서 검열 ABCD
//		if(orderStatus[0]!="") {
//			System.out.println("주문상태로 검색한다.");
//			allOrderList = orderListService.orderListSearch(o);
//			
//			//여기는 모든 것을 다불러옴
//			System.out.println("이프문안에 "+allOrderList);
//			
//			//받아온 주문상태에 대해서 순환
//			for(int i =0;i<orderStatus.length;i++) {		
//				System.err.println("orederStatus관련 ="+orderStatus[i]);
//				String vs=orderStatus[i];
//				
//				//뽑아온 모든 리스트에대한 순환
//			for(int j=0;j<allOrderList.size();j++) {
//				
//				//날짜값이 있냐 없냐로 따짐.
//				if(!startDate.after(allOrderList.get(i).getOrderDate())
//				&& !endDate.before(allOrderList.get(i).getOrderDate())) {
//
//			    //주문상태에 대해서 case분기문 실행
//				switch(vs) {
//				case "A":
//					if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//					list.add(allOrderList.get(j));
//					}
//					break;
//				case "B":
//					if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//					list.add(allOrderList.get(j));
//					}
//					break;
//				case "C":
//					if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//						
//					list.add(allOrderList.get(j));
//					}
//					break;
//				case "D":
//					if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//						
//					list.add(allOrderList.get(j));
//					}
//					break;
//				case "E":
//					if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//					list.add(allOrderList.get(j));
//					}
//					break;
//					}
//				}
//				//주문 요일이 없을경우에 대한 처리문.
//				else {
//					switch(vs) {
//					case "A":
//						System.out.println("참거짓"+vs.equals(allOrderList.get(i).getDeliveryState()));
//						System.out.println("여기는 오는가?");
//						System.out.println(allOrderList.get(i).getDeliveryState());
//						if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//							
//						list.add(allOrderList.get(j));
//						}
//						break;
//					case "B":
//						if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//						list.add(allOrderList.get(j));
//						}
//						break;
//					case "C":
//						if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//							
//						list.add(allOrderList.get(j));
//						}
//						break;
//					case "D":
//						if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//							
//						list.add(allOrderList.get(j));
//						}
//						break;
//					case "E":
//						if(vs.equals(allOrderList.get(j).getDeliveryState())) {
//						list.add(allOrderList.get(j));
//						}
//						break;
//						}
//				}
//			}
//			}
//		log.debug("allOrderList={}"+allOrderList);
//		}
//		//주문 상태에 대한 값이 없을 경우
//			else {
//			System.out.println("걍검색이 시작된다");
//			allOrderList = orderListService.orderListSearch(o); 
//		}
		
		
		
		
		// 진희
		if (endDate.equals(java.sql.Date.valueOf("1994-04-07"))) {
			endDate = new Date(new java.util.Date().getTime());
		}
		
		  Product p = new Product();
		  p.setProductName(productName); 
		
		/* List<OrderList> list = new ArrayList<>(); */
		int totalOrders = orderListService.totalOrders(o);

		
		//날짜 검색 문
//		for (int i = 0; i < allOrderList.size(); i++) {
//			if (!startDate.after(allOrderList.get(i).getOrderDate())
//					&& !endDate.before(allOrderList.get(i).getOrderDate())) {
//				list.add(allOrderList.get(i));
//			}
//		}
		
		//결과 list에 대한 자료값들 변환 해주는 곳.
		log.debug("list" + list);
		for (int i = 0; i < list.size(); i++) {
			switch (list.get(i).getDeliveryState()) {
			case "A":
				list.get(i).setDeliveryState("입금대기");
				break;
			case "B":
				list.get(i).setDeliveryState("결제완료");
				break;
			case "C":
				list.get(i).setDeliveryState("배송준비");	
				break;
			case "D":
				list.get(i).setDeliveryState("배송중");
				break;
			case "E":
				list.get(i).setDeliveryState("배송완료");
				break;
			}
			if(list.get(i).getPayState().contains("N")) {
				list.get(i).setPayState("미입금");
			}else {
				list.get(i).setPayState("입금완료");
			}
		
		}
		
		for (int i = 0; i < list.size(); i++) {
		switch (list.get(i).getPayMethod()) {
		case "ph":
			list.get(i).setPayMethod("휴대전화");
			break;
		case "cr":
			list.get(i).setPayMethod("신용카드");
			break;
		case "ac":
			list.get(i).setPayMethod("무통장");	
			break;
		case "va":
			list.get(i).setPayMethod("가상계좌");
			break;
		case "ka":
			list.get(i).setPayMethod("카카오페이");
		case "to":
			list.get(i).setPayMethod("토스");
			break;
		case "na":
			list.get(i).setPayMethod("네이버페이");
			break;
		}
	}
		
		// 자료형 확인하는 공간
		// 제품 갯수 구하기
//		System.err.println("orderStatusList"+list);
		mav.addObject("totalOrders", totalOrders);
//		mav.addObject("orderStatusList",list);
//		log.debug("searchList={}",list);
		mav.addObject("list", list);
		mav.setViewName("shop/admin/order/orderList");

		return mav;
	}

	@GetMapping("/orderList.do")
	public ModelAndView orderList(ModelAndView mav, String sellerId) {
		log.debug("오더리스트들어가기");
		String ellerId = "ekfcjd2";

		List<OrderList> list = orderListService.orderList(sellerId);
		/*
		 * List<Attachment> attachList = new ArrayList<>(); for (int
		 * i=0;i<list.size();i++) { Attachment a =
		 * orderListService.selectAttachOne(list.get(i).getProductId());
		 * attachList.add(a); }
		 */
		OrderList o = new OrderList();
		for (int i = 0; i < list.size(); i++) {
			switch (list.get(i).getDeliveryState()) {
			case "A":
				list.get(i).setDeliveryState("입금대기");
				break;
			case "B":
				list.get(i).setDeliveryState("결제완료");
				break;
			case "C":
				list.get(i).setDeliveryState("배송준비");	
				break;
			case "D":
				list.get(i).setDeliveryState("배송중");
				break;
			case "E":
				list.get(i).setDeliveryState("배송완료");
				break;
			}
			if(list.get(i).getPayState().contains("N")) {
				list.get(i).setPayState("미입금");
			}else {
				list.get(i).setPayState("입금완료");
			}
		
		}
		for (int i = 0; i < list.size(); i++) {
		switch (list.get(i).getPayMethod()) {
		case "ph":
			list.get(i).setPayMethod("휴대전화");
			break;
		case "cr":
			list.get(i).setPayMethod("신용카드");
			break;
		case "ac":
			list.get(i).setPayMethod("무통장");	
			break;
		case "va":
			list.get(i).setPayMethod("가상계좌");
			break;
		case "ka":
			list.get(i).setPayMethod("카카오페이");
		case "to":
			list.get(i).setPayMethod("토스");
			break;
		case "na":
			list.get(i).setPayMethod("네이버페이");
			break;
		}
	}
		
		int totalOrders = orderListService.totalOrders(o);
		
		
		mav.addObject("totalOrders", totalOrders);
		mav.addObject("list", list);
//		mav.addObject("attachList",attachList);
		mav.setViewName("shop/admin/order/orderList");
		return mav;
	}
	

}
