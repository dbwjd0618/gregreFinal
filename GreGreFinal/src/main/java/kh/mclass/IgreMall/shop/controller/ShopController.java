package kh.mclass.IgreMall.shop.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@GetMapping("/shop.do")
	public ModelAndView shop(ModelAndView mav) {
		
		mav.setViewName("shop/shop");
		return mav;
	}
	@GetMapping("/category.do")
	public ModelAndView category(ModelAndView mav) {
		
		mav.setViewName("shop/category/category");
		return mav;
	}
	
	@GetMapping("/cart.do")
	public ModelAndView cart(ModelAndView mav) {
		mav.setViewName("shop/cart/cart");
		return mav;
	}
	@GetMapping("/checkOut.do")
	public ModelAndView checkOut(ModelAndView mav) {
		mav.setViewName("shop/checkOut/checkOut");
		return mav;
	}
	
	
}
