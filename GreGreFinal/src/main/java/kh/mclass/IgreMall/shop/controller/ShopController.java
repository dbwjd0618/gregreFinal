package kh.mclass.IgreMall.shop.controller;


import java.util.ArrayList;
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
		
		Product cate3 = new Product(category3);
		final int numPerPage =10;
		int cPage3=1;
		try{
			cPage3 = Integer.parseInt(request.getParameter("cPage"));
		} catch(NumberFormatException e){
		
		}

		List<Product> list = shopService.productList(cPage3,numPerPage,cate3);
		//2.제품 갯수 구하기.
		int totalProducts = shopService.selectTotalProducts(cate3);
		final int totalPage = (int)Math.ceil((double)totalProducts/numPerPage);
		log.debug("totalPage={}",totalPage);
		String pageBar = "";
		
		final int pageBarSize = 5;
		int pageStart = ((cPage3 - 1)/pageBarSize) * pageBarSize +1;
		int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		
		log.debug("pageStart{}",pageStart);
		
		
		//카테고리1&카테고리2 
		//ex) CA1&CA2    CA3&CA4  CA5&CA6   CA7
		List<Product> totalCategoryList = new ArrayList<>();
//		카테고리1 제품 출력
		Product category1Prod = new Product();
		category1Prod.setCategoryId(category1);
		List<Product> category1List = shopService.productList(category1Prod);
		log.debug("!!category1List={}",category1List);
		
		for(int i=0;i<category1List.size();i++) {
			totalCategoryList.add(category1List.get(i));
		}
		
		//2.카테고리1 제품개수 구하기.
		int totalProd1 = shopService.selectTotalProducts(category1Prod);
		int totalAllProd= totalProd1;
//		카테고리2 제품 출력
		if(category2 !=null) {
			Product category2Prod = new Product();
			category2Prod.setCategoryId(category2);
			List<Product> category2List = shopService.productList(category2Prod);
			log.debug("!!category2List={}",category2List);
			for(int i=0;i<category2List.size();i++) {
				totalCategoryList.add(category2List.get(i));
			}
			//2.카테고리1 제품개수 구하기.
			int totalProd2 = shopService.selectTotalProducts(category2Prod);
			totalAllProd +=totalProd2;
			mav.addObject("category2List",category2List);
		}
		
		
		log.debug("!!totalCategoryList={}",totalCategoryList);
		
		//[이전] section
		if(pageNo == 1 ){
			pageBar += "<span>[이전]</span>"; 
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/shop/category.do?category3="+category3+"&category1="+category3+"&cPage="+(pageNo-1)+"'>[이전]</a> ";
		}
			
		// pageNo section
		while(!(pageNo>pageEnd || pageNo > totalPage)){
			
			if(cPage == pageNo ){
				pageBar += "<span class='cPage'>"+pageNo+"</span> ";
			} 
			else {
				pageBar += "<a href='"+request.getContextPath()+"/shop/category.do?category3="+category3+"&category1="+category3+"&cPage="+pageNo+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		//[다음] section
		if(pageNo > totalPage){
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='"+request.getContextPath()+"/shop/category.do?category3="+category3+"&category1="+category3+"&cPage="+pageNo+"'>[다음]</a>";
		}
		mav.addObject("list",list);
		mav.addObject("totalAllProd",totalAllProd);
		mav.addObject("pageBar",pageBar);
		mav.addObject("category1List",category1List);
		mav.addObject("category1",category1);
		mav.addObject("category2",category2);
		mav.addObject("totalCategoryList", totalCategoryList);
		mav.setViewName("shop/category/category");
		log.debug("category3={}",category3);	
		log.debug("category={},@@{}",category1,category2);

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
