package kh.mclass.IgreMall.admin.sales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SalesBookController {

	@GetMapping("/shopadmin/account.do")
	public ModelAndView account(ModelAndView mav) {
		log.debug("들어올껄");
		mav.setViewName("shop/admin/sales/accountBooks");
	return mav;
	}
	
}
