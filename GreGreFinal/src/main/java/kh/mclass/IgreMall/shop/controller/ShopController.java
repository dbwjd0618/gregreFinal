package kh.mclass.IgreMall.shop.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.product.model.vo.ProductCount;
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
	
	/**
	 * 0412 이진희
	 * 
	 * 제품 목록 출력 수정
	 */
	@GetMapping("/category.do")
	public ModelAndView category(ModelAndView mav, @RequestParam(value="cPage", defaultValue="1") int cPage, String category1,String category2, HttpServletRequest request, HttpServletResponse response) {
		

		final int numPerPage =9;
		
		//카테고리 담기
		Map<String,String> categories = new HashMap<>();
		
		categories.put("category1", category1);
		
		if(category2 !=null) {
			categories.put("category2", category2);
		}
		//카테고리1&카테고리2  출력
		//ex) CA1&CA2    CA3&CA4  CA5&CA6   CA7
		List<Product> totalCategoryList = shopService.productListAll(cPage, numPerPage, categories);

		
//		카테고리1 제품 출력
		Product category1Prod = new Product();
		category1Prod.setCategoryId(category1);
		List<Product> category1List = shopService.productList(category1Prod);
		log.debug("!!category1List={}",category1List);	
		
		//2.카테고리1 제품개수 구하기.
		int totalProd1 = shopService.selectTotalProducts(category1Prod);
		int totalAllProd= totalProd1;
//		카테고리2 제품 출력
		if(category2 !=null) {
			Product category2Prod = new Product();
			category2Prod.setCategoryId(category2);
			List<Product> category2List = shopService.productList(category2Prod);
			
			//2.카테고리1 제품개수 구하기.
			int totalProd2 = shopService.selectTotalProducts(category2Prod);
			totalAllProd +=totalProd2;
			mav.addObject("category2List",category2List);
		}
		
		
		log.debug("!!totalCategoryList={}",totalCategoryList);
		
		
//		
//		int endPage = ((totalAllProd-1)/numPerPage)+1; //마지막페이지 번호
//	      
//	      if(cPage>endPage) { //크면 마지막페이지고
//	         cPage = endPage;
//	      }
//	      if(cPage<1) {
//	         cPage = 1;
//	      }
//	    
	   
	  	//페이지바수(페이지에 표시될 페이지수)
	    final int totalPage= (int)Math.ceil((double)totalAllProd/numPerPage); 
		final int pageBarSize = 10;
			
		final int pageStart = ((cPage-1)/pageBarSize)*pageBarSize+1;		 		
		final int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		
		mav.addObject("pageNo",pageNo);
		mav.addObject("pageEnd", pageEnd);
		mav.addObject("pageStart", pageStart);
		mav.addObject("totalPage",totalPage);
	    mav.addObject("cPage",cPage);
	
		
		mav.addObject("totalAllProd",totalAllProd);
		mav.addObject("category1List",category1List);
		mav.addObject("category1",category1);
		mav.addObject("category2",category2);
		mav.addObject("totalCategoryList", totalCategoryList);
		mav.setViewName("shop/category/category");
		
		return mav;
	}
	
	

	
	
}
