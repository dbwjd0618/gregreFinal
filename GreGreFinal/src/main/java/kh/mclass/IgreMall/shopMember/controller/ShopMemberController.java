package kh.mclass.IgreMall.shopMember.controller;

import java.util.ArrayList;
import java.util.Arrays;
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

import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.IgreMall.product.model.service.ProductService;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
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
	/**
	 * 0405 이진희
	 * 
	 * 장바구니 옵션 삭제
	 * @return
	 */
	@PostMapping("/optionDelete.do")
	@ResponseBody
	public Map<String,Object> optionDelete(@RequestParam(value = "optionId", required = false) String optionId,
								@RequestParam(value = "cartId", required = false) String cartId,
								 HttpSession session) {
		
		Cart cart= shopMemberService.selectCartOne(cartId); 
		List<String> optionIdList = new ArrayList<>(Arrays.asList(cart.getOptionId()));
		List<String> prodCountList = new ArrayList<>(Arrays.asList(cart.getProdCount()));
		int idx = optionIdList.indexOf(optionId);
		
		//옵션 id 삭제
		optionIdList.remove(optionId);
		cart.setOptionId(optionIdList.toArray(new String[optionIdList.size()]));
		//옵션수량 삭제
		prodCountList.remove(idx);	
		cart.setProdCount(prodCountList.toArray(new String[prodCountList.size()]));
		
		
		int result = shopMemberService.updateCartOne(cart);
		
		Map<String,Object> map = new HashMap<>();
		if(result>0) {
			map.put("cartId", cartId);
			map.put("optionId", optionId);
		}
	
		return map;
	}
			
	/**
	 * 0403 이진희
	 * 
	 * 장바구니 담기
	 * @return
	 */
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

		String message= "장바구니 담기 실패";
		String[] optionId = new String[optionIdList.size()];
		String[] count = new String[optionIdList.size()];
		if(!optionIdList.get(0).equals(product.getProductId())) {
			for(int i=0; i<optionIdList.size();i++) {
				optionId[i] = optionIdList.get(i);
				count[i] = countList.get(i);
			}	
			cart = new Cart(null, memberId, product.getProductId(), optionId, count , null);
			int result = shopMemberService.insertCart(cart);
			log.debug("장바구니={}", cart);
			
			if(result ==1) {
				message="장바구니 담기 성공!";
			}
			
		}else {
			
			count[0] = countList.get(0);
			
			cart = new Cart(null, memberId, product.getProductId(), null, count , null);
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
	/**
	 * 0403 이진희
	 * 
	 * 장바구니 목록 출력
	 */
	@GetMapping("/cart.do")
	public ModelAndView cart(ModelAndView mav,
						HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		List<Cart> cartList = shopMemberService.selectCartList(m.getMemberId()); 
	    List<String> allPriceList = new ArrayList<>();
	    
	
		for(int i=0;i<cartList.size();i++) {
			String productId = cartList.get(i).getProductId();
			Product p = productService.selectProductOne(productId);
			List<Attachment> attachList = productService.selectAttachList(productId);
			List<ProdOption> optionList = new ArrayList<>();
		    if(cartList.get(i).getOptionId() != null) {
		    	for(int t=0; t<cartList.get(i).getOptionId().length;t++) {
		    		String optionId = cartList.get(i).getOptionId()[t];
		    		ProdOption prodOption = productService.selectOptionOne(optionId);
		    		
		    		optionList.add(prodOption);
		    	}
		    	
		    }
			
			
			p.setAttachList(attachList);
			
			cartList.get(i).setOptionList(optionList);
			cartList.get(i).setProduct(p);
			System.out.println("optionList="+optionList);
			//옵션이 있는 경우
			if (cartList.get(i).getOptionId() != null) {
				int optionPrice=0;
	
				for(int j=0;j<optionList.size();j++) {
					int stock = Integer.parseInt(cartList.get(i).getProdCount()[j]);
					System.out.println("stock="+stock);
					optionPrice += (optionList.get(j).getOptionPrice() - p.getDiscountPrice())*stock;
					System.out.println("optionPrice="+optionPrice);
				}
				System.out.println("optionPrice="+optionPrice);
				allPriceList.add(Integer.toString(optionPrice));
				
			}else {
			
				int stock = Integer.parseInt(cartList.get(i).getProdCount()[0]);
				int prodPrice = (p.getPrice()-p.getDiscountPrice())*stock;
				String price = Integer.toString(prodPrice);
				allPriceList.add(price);
			}
		}
		
		
		mav.addObject("cartList", cartList);
		mav.addObject("allPriceList", allPriceList);
		mav.setViewName("shop/myShopping/cart/list");
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
