package kh.mclass.IgreMall.shop.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.shop.model.service.ShopService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	@GetMapping("/shop.do")
	public ModelAndView shop(ModelAndView mav) {
		
		mav.setViewName("shop/shop");
		return mav;
	}
	@GetMapping("/category.do")
	public ModelAndView category(ModelAndView mav, @RequestParam(value="cPage", defaultValue="1") int cPage, String category1,String category2,String category3, HttpServletRequest request, HttpServletResponse response) {
		log.debug("상품리스트 출력");
		
		final int numPerPage =10;
		
		Product cate3 = new Product(category3);
		
		List<Product> list = shopService.productList(cPage,numPerPage,cate3);
		
		//2.제품 갯수 구하기.
		int totalProducts = shopService.selectTotalProducts();
		final int totalPage = (int)Math.ceil((double)totalProducts/numPerPage);
		
		String pageBar = "";	
		final int pageBarSize = 5;
		int pageStart = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		
		//[이전] section
		if(pageNo == 1 ){
			pageBar += "<span>[이전]</span>"; 
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/shop/category?cPage="+(pageNo-1)+"'>[이전]</a> ";
		}
			
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			
			if(cPage == pageNo ){
				pageBar += "<span class='cPage'>"+pageNo+"</span> ";
			} 
			else {
				pageBar += "<a href='"+request.getContextPath()+"/shop/category?cPage="+pageNo+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='"+request.getContextPath()+"/shop/category?cPage="+pageNo+"'>[다음]</a>";
		}
		mav.addObject("list",list);
		mav.addObject("totalProducts",totalProducts);
		mav.addObject("pageBar",pageBar);
		mav.addObject("category1",category1);
		mav.addObject("category2",category2);
		mav.setViewName("shop/category/category");
		log.debug("category3={}",category3);	
		log.debug("category={},@@{}",category1,category2);
		log.debug("뭐지 ..");
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
