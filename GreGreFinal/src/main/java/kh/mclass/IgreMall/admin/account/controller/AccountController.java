package kh.mclass.IgreMall.admin.account.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.account.model.service.AccountService;
import kh.mclass.IgreMall.admin.account.model.vo.Account;
import kh.mclass.IgreMall.admin.account.model.vo.PayMethod;
import kh.mclass.IgreMall.admin.coupon.model.vo.ChartValue;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop/admin/account")
public class AccountController {
	@Autowired
	AccountService accountService;
	
	@RequestMapping("/list.do")
	public ModelAndView list(ModelAndView mav) {
		List<Account> list = accountService.Accountlist();
		List<PayMethod> plist = accountService.plist();
		List<ChartValue> clist= accountService.clist();
		mav.addObject("clist",clist);
		System.out.println(clist);
		mav.addObject("plist",list);
		/* mav.addObject("plist",plist); */
		log.debug("하하하{}",plist);
		mav.setViewName("shop/admin/account/list");
		return mav;
	}
	
	
	@RequestMapping("/search.do")
	public ModelAndView search(ModelAndView mav,
			@RequestParam(value = "deliveryState", required = false) String deliveryState,
			@RequestParam(value = "productName", defaultValue = "") String productName,
			@RequestParam(value = "payState", required = false) String payState,
			@RequestParam(value = "startDate", defaultValue = "1992-04-14") Date startDate,
			@RequestParam(value = "endDate", defaultValue = "1994-04-07") Date endDate,
			@RequestParam(value = "ostatus",defaultValue="") String ostatus,
			@RequestParam(value = "payMethod", required = false) String payMethod) {
		log.debug("매출정보를 검색합니다");
		System.err.println(payMethod);
		Account a = new Account();
		a.setPayState(payState);
		
		a.setPayMethod(payMethod);
		
		if (endDate.equals(java.sql.Date.valueOf("1994-04-07"))) {
			endDate = new Date(new java.util.Date().getTime());
		}
//		List<Account> list = accountService.Accountlist();
		List<Account> list = accountService.searchList(a);
		System.out.println("리스트 값이 담겨야해"+list);
		List<PayMethod> pslist = accountService.plist();
		
		//데이트값
		List<PayMethod> plist = accountService.searchplist(a);
		
		List<PayMethod> slist = new ArrayList<PayMethod>(); 
		List<Account> rlist = new ArrayList<Account>();
		PayMethod p = new PayMethod();
		int naCount=0;
		int naPrice=0;
		int kaCount=0;
		int kaPrice =0;
		int toCount = 0;
		int toPrice=0;
		int acCount=0;
		int acPrice=0;
		int raCount=0;
		int raPrice=0;
		int phCount=0;
		int phPrice=0;
		
		int totalSupValue=0;
		for (int i = 0; i < list.size(); i++) {
			System.out.println("들어가는가");
			if (!startDate.after(list.get(i).getOrderDate())
					&& !endDate.before(list.get(i).getOrderDate())) {
				System.out.println(list.get(i).getOrderDate());
				rlist.add(list.get(i));
				System.err.println(rlist.get(i).getSupplyValue());
				totalSupValue+=list.get(i).getSupplyValue();
			}
			
			switch (list.get(i).getPayMethod()) {
			case "na":
				naCount+=1;
				naPrice+= list.get(i).getTotalPrice();
				break;
			case "ka":
				kaCount+=1;
				kaPrice+= list.get(i).getTotalPrice();
				break;
			case "to":
				toCount+=1;
				toPrice+= list.get(i).getTotalPrice();
				break;
			case "ac":
				acCount+=1;
				acPrice+= list.get(i).getTotalPrice();
				break;
			case "ra":
				raCount+=1;
				raPrice+= list.get(i).getTotalPrice();
				break;
			case "ph":
				phCount+=1;
				phPrice+= list.get(i).getTotalPrice();
				break;
			}
			
		}
		System.out.println("여기서찍혀줘"+totalSupValue );
		if(rlist.size()!=0) {
		int totalCount= rlist.size();
		int totalPrice=naPrice+kaPrice+toPrice+acPrice;
		p.setTotalPrice(totalPrice);
		p.setSupplyValue(totalSupValue);
		p.setAcCount(acCount);
		p.setAcPrice(acPrice);
		p.setKaCount(kaCount);
		p.setKaPrice(kaPrice);
		p.setNaCount(naCount);
		p.setNaPrice(naPrice);
		p.setToCount(toCount);
		p.setToPrice(toPrice);
		p.setTotalCount(totalCount);
		}else {
			p.setTotalPrice(0);
			p.setSupplyValue(0);
			p.setAcCount(0);
			p.setAcPrice(0);
			p.setKaCount(0);
			p.setKaPrice(0);
			p.setNaCount(0);
			p.setNaPrice(0);
			p.setToCount(0);
			p.setToPrice(0);
			p.setTotalCount(0);
		}
		log.debug("리스트 "+list);
		mav.addObject("list	",list);
		
		//리스트로 해당 Account값들이 담겨있다.
		log.debug("rList={}",rlist);
		
		log.debug("pList={}",plist);//리스트로 해당 Account값들이 담겨있다.
		
		mav.addObject("plist",rlist);
//		/* mav.addObject("p",p); */
		mav.setViewName("shop/admin/account/list");
		return mav;
	}
	
}
