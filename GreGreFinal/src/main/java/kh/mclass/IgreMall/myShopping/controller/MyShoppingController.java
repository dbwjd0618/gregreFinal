package kh.mclass.IgreMall.myShopping.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop/myShopping")
public class MyShoppingController {
	
	@GetMapping("/order/list.do")
	public ModelAndView orderList(ModelAndView mav) {
		mav.setViewName("shop/myShopping/order/list");
		return mav;
	}
	@GetMapping("/wish/list.do")
	public ModelAndView wishList(ModelAndView mav) {
		mav.setViewName("shop/myShopping/wish/list");
		return mav;
	}
	
	@GetMapping("/QnA/list.do")
	public ModelAndView QnAList(ModelAndView mav) {
		mav.setViewName("shop/myShopping/QnA/list");
		return mav;
	}
	        
	@GetMapping("/review/list.do")
	public ModelAndView reviewList(ModelAndView mav) {
		mav.setViewName("shop/myShopping/review/list");
		return mav;
	}
	@GetMapping("/event/list.do")
	public ModelAndView eventList(ModelAndView mav, Model model) {
		mav.setViewName("shop/myShopping/event/list");
		return mav;
	}
	@GetMapping("/coupon/list.do")
	public ModelAndView couponList(ModelAndView mav) {
		mav.setViewName("shop/myShopping/coupon/list");
		return mav;
	}
	
}
