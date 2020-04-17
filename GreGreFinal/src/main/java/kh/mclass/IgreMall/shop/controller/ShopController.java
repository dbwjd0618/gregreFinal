package kh.mclass.IgreMall.shop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.IgreMall.product.model.service.ProductService;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.shop.model.service.ShopService;
import kh.mclass.IgreMall.shopMember.model.service.ShopMemberService;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import kh.mclass.IgreMall.wish.model.service.WishService;
import kh.mclass.IgreMall.wish.model.vo.Wish;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	ShopService shopService;
	@Autowired
	WishService wishService;
	@Autowired
	ShopMemberService shopMemberService;
	@Autowired
	ProductService productService;
	
	
	
	@GetMapping("/shop.do")
	public ModelAndView shop(ModelAndView mav, HttpSession session) {
		

		Member m = (Member) session.getAttribute("memberLoggedIn");
		String memberId = "";
		if (m != null) {
			memberId = m.getMemberId();
		}
		// 회원 찜하기 목록
		List<Wish> wishList = wishService.selectWishList(memberId);
		
		
		List<Cart> cartList = shopMemberService.selectCartList(memberId);
		List<String> allPriceList = new ArrayList<>();

		for (int i = 0; i < cartList.size(); i++) {
			String productId = cartList.get(i).getProductId();
			Product p = productService.selectProductOne(productId);
			List<Attachment> attachList = productService.selectAttachList(productId);
			p.setAttachList(attachList);
			List<ProdOption> optionList = new ArrayList<>();
			if (cartList.get(i).getOptionId() != null) {
				for (int t = 0; t < cartList.get(i).getOptionId().length; t++) {
					String optionId = cartList.get(i).getOptionId()[t];
					ProdOption prodOption = productService.selectOptionOne(optionId);

					optionList.add(prodOption);
				}

			}

			p.setAttachList(attachList);

			cartList.get(i).setOptionList(optionList);
			cartList.get(i).setProduct(p);

			// 옵션이 있는 경우
			if (cartList.get(i).getOptionId() != null) {
				int optionPrice = 0;

				for (int j = 0; j < optionList.size(); j++) {
					int stock = Integer.parseInt(cartList.get(i).getProdCount()[j]);
					optionPrice += (optionList.get(j).getOptionPrice() - p.getDiscountPrice()) * stock;
				}

				allPriceList.add(Integer.toString(optionPrice));

			} else {

				int stock = Integer.parseInt(cartList.get(i).getProdCount()[0]);
				int prodPrice = (p.getPrice() - p.getDiscountPrice()) * stock;
				String price = Integer.toString(prodPrice);
				allPriceList.add(price);
			}
		}
			
		
		int totalProdPrice = 0;
		int totalDeliPrice = 0;
		int totalDisPrice = 0;
		for (int i = 0; i < allPriceList.size(); i++) {
			totalProdPrice += Integer.parseInt(allPriceList.get(i));
			totalDeliPrice += Integer.parseInt(cartList.get(i).getProduct().getDeliveryFee());

			int discountPrice = cartList.get(i).getProduct().getDiscountPrice();
			for (int j = 0; j < cartList.get(i).getProdCount().length; j++) {
				int count = Integer.parseInt(cartList.get(i).getProdCount()[j]);
				totalDisPrice += discountPrice * count;
			}

		}

		int totalOrderPrice = totalProdPrice + totalDeliPrice - totalDisPrice;
		
		//추천 상품 
		List<Product> prodList = productService.selectRecoProdList();

		
		Map<String, Integer> countMap = new HashMap<>();
		for(int i=0;i<prodList.size();i++) {
			for(int j=0;j<prodList.get(i).getOrderProduct().getProdCount().length;j++) {
				String[] prodCountArr =prodList.get(i).getOrderProduct().getProdCount();
				int cnt = 0;
				for(int t=0;t<prodCountArr.length;t++) {
					cnt += Integer.parseInt(prodCountArr[t]);
				}
				countMap.put(prodList.get(i).getProductId(), cnt);
			}
		}
		
		log.debug("countMap={}",countMap);
		
		 //[1] 입력
        int[] score = new int[countMap.size()];
        String[] productIdArr = new String[countMap.size()];
        Set set = countMap.keySet();

        Iterator iterator = set.iterator();
        
        int idx=0;
        
        while(iterator.hasNext()){
        	  String key = (String)iterator.next();
        	  score[idx] = countMap.get(key);
        	  productIdArr[idx] = key; 
        	  idx++;
        }
        
        int[] rank = new int[countMap.size()];
           
        //[2] 처리                     
        for(int i=0; i<score.length; i++){
            rank[i] = 1; //1등으로 초기화
           
            for (int j = 0; j < score.length; j++) { //기준데이터와 나머지데이터비교                             
                if(score[i]<score[j]){   //기준데이터가 나머지데이터라 비교했을때 적으면 rank[i] 카운트
                    rank[i]++; //COUNT                 
                }              
            }          
        }      
        
       for(int i=0;i<score.length;i++) {
    	   for(int j=i+1;j<score.length;j++) {
    		   if(rank[i]> rank[j]) {
    			   int tmep = score[i];
    			   score[i]= score[j];
    			   score[j] = tmep;
    			   
    			   int rmep = rank[i];
    			   rank[i]= rank[j];
    			   rank[j] = rmep;
    			   
    			   String pmep = productIdArr[i];
    			   productIdArr[i]= productIdArr[j];
    			   productIdArr[j] = pmep;
    			   
    		   }
    	   }
       }
		
		List<Product> recoProdList = new ArrayList<>();
		for(int i=0;i<score.length;i++) {
			if(rank[i]<6 && rank[i]>0) {
				String productId = productIdArr[i];
				Product p = productService.selectProductOne(productId);
				recoProdList.add(p);
			}
		}
		
		//추천상품
		mav.addObject("recoProdList", recoProdList);
		
		//총 상품금액
		session.setAttribute("totalProdPrice", totalProdPrice);
		//총 배송비
		session.setAttribute("totalDeliPrice", totalDeliPrice);
		//총 할인금액
		session.setAttribute("totalDisPrice", totalDisPrice);
		//결제금액
		session.setAttribute("totalOrderPrice", totalOrderPrice);
		
		session.setAttribute("cartList", cartList);
		session.setAttribute("wishList", wishList);
		session.setAttribute("cartListCount", cartList.size());
		session.setAttribute("allPriceList", allPriceList);
		
		session.setAttribute("wishListConut",wishList.size());
		mav.setViewName("shop/shop");
		return mav;
	}

	/**
	 * 0414 이진희
	 * 
	 * 제품 검색
	 */
	@GetMapping("/searchList.do")
	public ModelAndView searchList(ModelAndView mav, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "keyword", required = false) String keyword, HttpSession session) {

		final int numPerPage = 12;
		Product p = new Product();
		p.setKeyword(keyword);

		Member m = (Member) session.getAttribute("memberLoggedIn");
		String memberId = "";
		if (m != null) {
			memberId = m.getMemberId();
		}
		// 회원 찜하기 목록
		List<Wish> wishList = wishService.selectWishList(memberId);

		// 카테고리 담기
		Map<String, String> categories = new HashMap<>();

		// 검색 상품 출력
		List<Product> searchList = shopService.searchListAll(cPage, numPerPage, p);
		
		
		//2. 전체컨텐츠수 구하기
		int totalAllProd = shopService.selectProdTotalContents(p);
		
		// 찜하기 추가
		for (int i = 0; i < searchList.size(); i++) {
			for (int j = 0; j < wishList.size(); j++) {
				if (searchList.get(i).getProductId().equals(wishList.get(j).getProductId())) {
					searchList.get(i).setWish(wishList.get(j));
				}

			}
		}
		

		final int pageBarSize = 10;

		final int totalPage = (int) Math.ceil((double) totalAllProd / numPerPage);

		final int pageStart = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		final int pageEnd = pageStart + pageBarSize - 1;

		int pageNo = pageStart;

		mav.addObject("pageNo", pageNo);
		mav.addObject("pageEnd", pageEnd);
		mav.addObject("pageBarSize", pageBarSize);
		mav.addObject("pageStart", pageStart);
		mav.addObject("totalPage", totalPage);
		mav.addObject("cPage", cPage);

		mav.addObject("totalAllProd", totalAllProd);
		mav.addObject("totalCategoryList", searchList);
		mav.addObject("wishList", wishList);
		mav.addObject("keyword", keyword);

		mav.setViewName("shop/category/searchList");

		return mav;
	}

	/**
	 * 0412 이진희
	 * 
	 * 제품 목록 출력 수정
	 */
	@GetMapping("/category.do")
	public ModelAndView category(ModelAndView mav, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			String category1, String category2, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {

		final int numPerPage = 9;

		Member m = (Member) session.getAttribute("memberLoggedIn");
		String memberId = "";
		if (m != null) {
			memberId = m.getMemberId();
		}
		// 회원 찜하기 목록
		List<Wish> wishList = wishService.selectWishList(memberId);

		// 카테고리 담기
		Map<String, String> categories = new HashMap<>();

		categories.put("category1", category1);

		if (category2 != null) {
			categories.put("category2", category2);
		}
		// 카테고리1&카테고리2 출력
		// ex) CA1&CA2 CA3&CA4 CA5&CA6 CA7
		List<Product> totalCategoryList = shopService.productListAll(cPage, numPerPage, categories);

		// 찜하기 추가
		for (int i = 0; i < totalCategoryList.size(); i++) {
			for (int j = 0; j < wishList.size(); j++) {
				if (totalCategoryList.get(i).getProductId().equals(wishList.get(j).getProductId())) {
					totalCategoryList.get(i).setWish(wishList.get(j));
				}

			}
		}

//		카테고리1 제품 출력
		Product category1Prod = new Product();
		category1Prod.setCategoryId(category1);
		List<Product> category1List = shopService.productList(category1Prod);
		log.debug("!!category1List={}", category1List);

		// 2.카테고리1 제품개수 구하기.
		int totalProd1 = shopService.selectTotalProducts(category1Prod);
		int totalAllProd = totalProd1;
//		카테고리2 제품 출력
		if (category2 != null) {
			Product category2Prod = new Product();
			category2Prod.setCategoryId(category2);
			List<Product> category2List = shopService.productList(category2Prod);

			// 2.카테고리1 제품개수 구하기.
			int totalProd2 = shopService.selectTotalProducts(category2Prod);
			totalAllProd += totalProd2;
			mav.addObject("category2List", category2List);
		}

		final int pageBarSize = 10;

		final int totalPage = (int) Math.ceil((double) totalAllProd / numPerPage);

		final int pageStart = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		final int pageEnd = pageStart + pageBarSize - 1;

		int pageNo = pageStart;

		mav.addObject("pageNo", pageNo);
		mav.addObject("pageEnd", pageEnd);
		mav.addObject("pageBarSize", pageBarSize);
		mav.addObject("pageStart", pageStart);
		mav.addObject("totalPage", totalPage);
		mav.addObject("cPage", cPage);

		mav.addObject("totalAllProd", totalAllProd);
		mav.addObject("category1List", category1List);
		mav.addObject("category1", category1);
		mav.addObject("category2", category2);
		mav.addObject("totalCategoryList", totalCategoryList);
		log.debug("wishList={}", wishList);
		mav.addObject("wishList", wishList);
		mav.setViewName("shop/category/category");

		return mav;
	}

}
