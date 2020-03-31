package kh.mclass.IgreMall.order.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.order.model.service.OrderService;
import kh.mclass.IgreMall.product.model.service.ProductService;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/order")
public class OrderController {
	
	@Autowired
	OrderService orderService;
	@Autowired
	ProductService productService;
	
	@PostMapping("/checkOut.do")
	public ModelAndView checkOut(ModelAndView mav,
							HttpServletRequest request,
							@RequestParam(value = "optionId", required = false) String[] optionId,
							@RequestParam(value = "optionPrice", required = false) String[] optionPrice,
							@RequestParam(value = "count", required = false) String[] count) {
		
		HttpSession session = request.getSession();
		Product product = (Product)session.getAttribute("p");
		List<Attachment> attachList = (List<Attachment>)session.getAttribute("attachList");
		
		List<ProdOption> optionList = new ArrayList<>();
		for(int i=0; i<optionId.length;i++) {
			String optionID = optionId[i];
			ProdOption option = productService.selectOptionOne(optionID);
			option.setOptionPrice(Integer.parseInt(optionPrice[i]));
			option.setOptionStock(Integer.parseInt(count[i]));
			optionList.add(option);
		}
			
		
		mav.addObject("p", product);
		mav.addObject("optionList", optionList);
		mav.addObject("attachList", attachList);
		mav.setViewName("shop/checkOut/checkOut");
		return mav;
	}
	
	
}
