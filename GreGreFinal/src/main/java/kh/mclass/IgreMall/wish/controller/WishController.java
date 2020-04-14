package kh.mclass.IgreMall.wish.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.IgreMall.wish.model.service.WishService;
import kh.mclass.IgreMall.wish.model.vo.Wish;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/wish")
public class WishController {

	
	@Autowired
	WishService wishService;

	/**
	 * 0414 이진희
	 * 
	 * 관심상품 삭제(복수개)
	 */
	@PostMapping("/wishListDelete.do")
	@ResponseBody
	public boolean deleteWishList( @RequestParam(value = "wishIdArr[]", required = false) List<String> wishIdArr,
						                     HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		System.out.println("wishIdArr="+wishIdArr);
		String memberId = m.getMemberId();
		int result =0;
		for(int i=0; i<wishIdArr.size();i++) {
			Wish wish = new Wish();
			wish.setMemberId(memberId);
			wish.setWishId(wishIdArr.get(i));
			result = wishService.deleteWishOne(wish);	
		}
		
		if(result>0) {
			return true;
		}else {
			return false;
		}
	
		
	}
	/**
	 * 0414 이진희
	 * 
	 * 관심상품 한개 삭제
	 */
	@PostMapping("/wishDeleteOne.do")
	@ResponseBody
	public boolean deleteWishOne( @RequestParam(value = "wishId", required = false) String wishId,
			HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		
		String memberId = m.getMemberId();
		Wish wish = new Wish();
		wish.setMemberId(memberId);
		wish.setWishId(wishId);
		
		int result = wishService.deleteWishOne(wish);
		if(result>0) {
			return true;
		}else {
			return false;
		}
		
		
	}
	/**
	 * 0413 이진희
	 * 
	 * 제품 찜하기
	 */
	@PostMapping("/wishUpdate.do")
	@ResponseBody
	public Map<String, Object> updateReivewReco(
			@RequestParam(value = "productId", required = false) String productId,
			HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		
		String memberId = m.getMemberId();
		Wish wish1 = new Wish();
		wish1.setMemberId(memberId);
		wish1.setProductId(productId);
		
		Wish wish2 = wishService.selectWishOne(wish1);
		
		int result=0;
		//update 
		if(wish2!=null && "N".equals(wish2.getWishCheck())) {
			wish1.setWishCheck("Y");
			result = wishService.updateWishCheck(wish1);
			
		}
		else if(wish2!=null && "Y".equals(wish2.getWishCheck())){
			
			wish1.setWishCheck("N");
			result = wishService.updateWishCheck(wish1);
		}
		// 처음  찜하기 버튼 클릭시 
		else if(wish2 ==null) {
			wish1.setWishCheck("Y");
			result = wishService.insertWish(wish1);
			
		}
		
		
		
		
		Map<String, Object> map = new HashMap<>();
		if (result > 0) {
			
			map.put("wishCheck",wish1.getWishCheck());
		}
		
		return map;
		
	}

	
	
}
