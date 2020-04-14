package kh.mclass.IgreMall.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.Igre.common.util.Utils;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.IgreMall.review.model.service.ProdReviewService;
import kh.mclass.IgreMall.review.model.vo.ProdReview;
import kh.mclass.IgreMall.review.model.vo.ReviewReco;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/review")
public class ProdReviewController {
	@Autowired
	ProdReviewService reviewService;
	
	/**
	 * 0413 이진희
	 * 
	 * 리뷰 추천 수 
	 */
	@PostMapping("/reivewRecoUpdate.do")
	@ResponseBody
	public Map<String, Object> updateReivewReco(
						@RequestParam(value = "reviewId", required = false) String reviewId,
						HttpSession session) {
		Member m = (Member) session.getAttribute("memberLoggedIn");
		
		String memberId = m.getMemberId();
		ReviewReco reviewReco1 = new ReviewReco();
		reviewReco1.setMemberId(memberId);
		reviewReco1.setReviewId(reviewId);
		
		ReviewReco reviewReco2 = reviewService.selectReviewReco(reviewReco1);
		
		//update 
		if(reviewReco2!=null && "N".equals(reviewReco2.getRecoCheck())) {
			reviewReco1.setRecoCheck("Y");
			int revRecoResult1= reviewService.updateRecoCheck(reviewReco1);
			
		}
		else if(reviewReco2!=null && "Y".equals(reviewReco2.getRecoCheck())){
			
			reviewReco1.setRecoCheck("N");
			int revRecoResult2= reviewService.updateRecoCheck(reviewReco1);
		}
		// 처음 리뷰 추천버튼 클릭시 
		else if(reviewReco2 ==null) {
			reviewReco1.setRecoCheck("Y");
			int revRecoResult3= reviewService.insertReviewReco(reviewReco1);
			
		}
		
		
		
		ProdReview review = reviewService.selectReviewOne(reviewId);
		int reviewRecoCount =0;
		if("N".equals(reviewReco1.getRecoCheck())) {
			reviewRecoCount = review.getReviewRecommen()-1;
			
		}else if("Y".equals(reviewReco1.getRecoCheck())) {
			
			reviewRecoCount = review.getReviewRecommen()+1;
		}
		review.setReviewRecommen(reviewRecoCount);
		int result = reviewService.updateReivewReco(review);
		
		review = reviewService.selectReviewOne(reviewId);

		Map<String, Object> map = new HashMap<>();
		if (result > 0) {
			map.put("reviewRecommen",review.getReviewRecommen());
			map.put("recoCheck",reviewReco1.getRecoCheck());
		}

		return map;
		
	}
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
			String renamedFileName ="";
			if(!"".equals(originalFileName)) {
				renamedFileName = Utils.getRenamedFileName(originalFileName);
				
			}
			
			prodReview.setRenamedImg(renamedFileName);
			prodReview.setOriginalImg(originalFileName);
	
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
