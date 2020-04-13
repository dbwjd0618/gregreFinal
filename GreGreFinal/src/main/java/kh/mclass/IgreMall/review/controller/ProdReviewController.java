package kh.mclass.IgreMall.review.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.common.util.Utils;
import kh.mclass.IgreMall.admin.product.model.exception.ProductException;
import kh.mclass.IgreMall.review.model.service.ProdReviewService;
import kh.mclass.IgreMall.review.model.vo.ProdReview;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/review")
public class ProdReviewController {
	@Autowired
	ProdReviewService reviewService;
	
	/**
	 * 0410 이진희
	 * 
	 * 리뷰삭제
	 */
	@PostMapping("/prodReviewDelete.do")
	public ModelAndView reviewDelete(ModelAndView mav,@RequestParam(value = "reviewId", required = false) String reviewId) {

		int result = reviewService.deleteReview(reviewId);

		mav.setViewName("redirect:/shop/myShopping/review/list.do");
		return mav;
		
	}
	/**
	 * 0410 이진희
	 * 
	 * 리뷰수정
	 */
	@PostMapping("/reviewUpdate.do")
	public ModelAndView reviewUpdate(ModelAndView mav, ProdReview prodReview,
									@RequestParam(value = "starPoint", required = false) String starPoint,
									MultipartHttpServletRequest mtfRequest, 
									HttpServletRequest request,
									String productId) {
		prodReview.setStarPoint(Integer.parseInt(starPoint));
		
		
		try {
			MultipartFile file = mtfRequest.getFile("upFile");
			// 파일명 재생성
			String originalFileName = file.getOriginalFilename();
			String renamedFileName = Utils.getRenamedFileName(originalFileName);
			
			prodReview.setOriginalImg(originalFileName);
			prodReview.setRenamedImg(renamedFileName);
	
			// 파일 이동 경로 
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/shop/memberProdReview");

			// 파일 생성.
			try {
				file.transferTo(new File(saveDirectory, renamedFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			log.error("리뷰오류!", e);
		}

		
		log.debug("prodReview={}", prodReview);
		int result = reviewService.updateReview(prodReview);
		mav.setViewName("redirect:/shop/myShopping/review/list.do");

		return mav;
	}
	
	/**
	 * 0410 이진희
	 * 
	 * 리뷰등록
	 */
		@PostMapping("/review.do")
		public ModelAndView review(ModelAndView mav, ProdReview prodReview,
								@RequestParam(value = "starPoint", required = false) String starPoint,
								MultipartHttpServletRequest mtfRequest, 
								HttpServletRequest request,
								String productId) {
	
		prodReview.setStarPoint(Integer.parseInt(starPoint));

		try {
			MultipartFile file = mtfRequest.getFile("upFile");
			// 파일명 재생성
			String originalFileName = file.getOriginalFilename();
			String renamedFileName = Utils.getRenamedFileName(originalFileName);
			
			prodReview.setOriginalImg(originalFileName);
			prodReview.setRenamedImg(renamedFileName);
	
			// 파일 이동 경로 
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/shop/memberProdReview");

			// 파일 생성.
			try {
				file.transferTo(new File(saveDirectory, renamedFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			log.error("리뷰오류!", e);
		}

		
		log.debug("prodReview={}", prodReview);
		int result = reviewService.insertReview(prodReview);
		mav.setViewName("redirect:/shop/myShopping/order/list.do");

		return mav;
	}
}
