package kh.mclass.IgreMall.admin.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.review.model.service.AdminReviewService;
import kh.mclass.IgreMall.admin.review.model.vo.AdminProdReview;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop/admin/review")
public class AdminReviewController {
	
	@Autowired
	AdminReviewService adminReviewService;
	@GetMapping("/delete.do")
	public ModelAndView AdminDeleteReview(ModelAndView mav,String reviewId) {
		log.debug(reviewId);
		int result = adminReviewService.deleteReview(reviewId);
		mav.setViewName("redirect:/shop/admin/review/list.do");
		return mav;
	}
	
	/**
	 * 0409 이진희
	 * 
	 *  리뷰보기 
	 *
	 */
	@GetMapping("/list.do")
	public ModelAndView AdminReviewList(ModelAndView mav, 
			/* @RequestParam("productId") String productId, */
						HttpServletRequest request) throws Exception {
		/* log.debug("productId={}", productId); */
		
		//review 불러오기
		List<AdminProdReview> reviewList = adminReviewService.selectListReview();
       /* for(int i=0;i<reviewList.size();i++) {
        	String[] optionName = new String[reviewList.get(i).getOptionId().length];
        	for(int j=0;j<reviewList.get(i).getOptionId().length;j++) {
        		ProdOption option = adminReviewService.selectOptionOne(reviewList.get(i).getOptionId()[j]);
        		optionName[j] = option.getOptionValue().replaceAll(",", "/");
        	}
        	reviewList.get(i).setOptionName(optionName);
        }
       
		Product product = adminReviewService.selectProductOne(productId);
		List<Attachment> attachList = adminReviewService.selectAttachList(productId);
		List<ProdOption> optionList = adminReviewService.selectOptionList(productId);
		
		//옵션이 있는 상품만
		if(!optionList.isEmpty()) {
	
			String[] optNm = optionList.get(0).getOptionName().split(",");
			List<String> optionName = new ArrayList<>();
			for(String o : optNm) {
				optionName.add(o);
			}
			
			List<String> optionValue1 = new ArrayList<String>();
			List<String> optionValue2 = new ArrayList<String>();
			
			for (int i = 0; i < optionList.size(); i++) {
				String[] values= optionList.get(i).getOptionValue().split(",");
				if (!optionValue1.contains(values[0])) {
					optionValue1.add(values[0]);
				}
				if(values.length>1) {
					if (!optionValue2.contains(values[1])) {
						optionValue2.add(values[1]);
					}
					
				}
			}*/
		
//			mav.addObject("optionValue1", optionValue1);//옵션1,옵션2
//			mav.addObject("optionValue2", optionValue2);//핑크 ~~
//			mav.addObject("optionName", optionName);//10,20담겨있다.
//		
			
//		}

        
        
     
        
        HttpSession session = request.getSession();
     	log.debug("reviewList={}",reviewList);
//        session.setAttribute("p",product);
//        session.setAttribute("attachList", attachList);
//        mav.addObject("p", product);
//		mav.addObject("attachList", attachList);
//		mav.addObject("optionList", optionList);//가격정보가 담겨있다.
		mav.addObject("reviewList", reviewList);
		
	
		mav.setViewName("shop/admin/board/adminreview/reviewList");
		return mav;
	}
}