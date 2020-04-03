package kh.mclass.IgreMall.shopMember.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.product.model.service.ProductService;
import kh.mclass.IgreMall.product.model.vo.Product;
import kh.mclass.IgreMall.shopMember.model.service.ShopMemberService;
import kh.mclass.IgreMall.shopMember.model.vo.Cart;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/myShopping")
public class ShopMemberController {
	
	@Autowired
	ShopMemberService shopMemberService;
	@Autowired
	ProductService productService;
	
	@PostMapping("/cartInsert.do")
	@ResponseBody
	public Object cart(
						HttpServletRequest request,
						@RequestParam(value = "optionIdList[]", required = false) List<String> optionIdList,
						@RequestParam(value = "countList[]", required = false) List<String> countList,
						@RequestParam(value = "memberId")String memberId) {
		
		Cart cart = null; 
		HttpSession session = request.getSession();
		Product product = (Product)session.getAttribute("p");
		System.out.println("Product"+product);
		System.out.println("MemberId"+memberId);
		System.out.println("count="+countList);
		System.out.println("optionId="+optionIdList);
		String message= "장바구니 담기 실패";
		if(!optionIdList.get(0).equals(product.getProductId())) {
			int[] result =new int[optionIdList.size()];
			for(int i=0; i<optionIdList.size();i++) {
				cart = new Cart(null, memberId, product.getProductId(), optionIdList.get(i), Integer.parseInt(countList.get(i)) , null);
				result[i] = shopMemberService.insertCart(cart);
			}	
			log.debug("장바구니={}", cart);
			for(int i=0; i<result.length;i++) {
				if(result[i] ==1) {
					message="장바구니 담기 성공";
				}
			}
		}else {
			System.out.println("여기로 들어오나");
			cart = new Cart(null, memberId, product.getProductId(), null, Integer.parseInt(countList.get(0)) , null);
			int result = shopMemberService.insertCart(cart);
			if(result ==1) {
				message="장바구니 담기 성공!";
			}
		}
		
		//리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
        
        //성공했다고 처리
        retVal.put("message", message);
		
		return retVal;
	}
	
	@GetMapping("/cart.do")
	public ModelAndView cart(ModelAndView mav) {
		
		mav.setViewName("shop/cart/cart");
		return mav;
	}
	
	
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
