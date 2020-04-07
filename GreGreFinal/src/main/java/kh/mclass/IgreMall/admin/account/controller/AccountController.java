package kh.mclass.IgreMall.admin.account.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.account.model.service.AccountService;
import kh.mclass.IgreMall.admin.account.model.vo.Account;
import kh.mclass.IgreMall.admin.account.model.vo.PayMethod;
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
		
		mav.addObject("list",list);
		mav.addObject("plist",plist);
		log.debug("하하하{}",plist);
		mav.setViewName("shop/admin/account/list");
		return mav;
	}
}
