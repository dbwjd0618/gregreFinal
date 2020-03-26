package kh.mclass.IgreMall.admin.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.common.util.Utils;
import kh.mclass.IgreMall.admin.product.model.exception.ProductException;
import kh.mclass.IgreMall.admin.product.model.service.AdminProductService;
import kh.mclass.IgreMall.product.model.vo.Attachment;
import kh.mclass.IgreMall.product.model.vo.Product;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/shop/admin/product")
public class ShopAdminProductController {
	@Autowired
	AdminProductService adminProductService;
	@Autowired
	ServletContext servletContext;

	@Autowired
	ResourceLoader resourceLoader;

	@GetMapping("/insert.do")
	public ModelAndView insertProduct(ModelAndView mav) {
		mav.setViewName("shop/admin/product/insertProduct");
		return mav;
	}

	@PostMapping("/insert.do")
	public String insertProduct(@ModelAttribute Product product, MultipartHttpServletRequest mtfRequest,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {
		log.debug("product={}", product);

		try {

			List<Attachment> attachList = new ArrayList<>();

			// 메인 이미지파일
			MultipartFile mainImgFile = mtfRequest.getFile("mainImg");

			String mainOriginalFileName = mainImgFile.getOriginalFilename(); // 원본 파일 명
			String mainRenamedFileName = Utils.getRenamedFileName(mainOriginalFileName);
			Attachment attach1 = new Attachment();
			attach1.setOriginalImg(mainOriginalFileName);
			attach1.setRenamedImg(mainRenamedFileName);
			attach1.setProductId(product.getProductId());
			attachList.add(attach1);
			// 파일이동
			String saveDirectory1 = request.getServletContext().getRealPath("/resources/upload/shop/productMainImg");

			try {
				mainImgFile.transferTo(new File(saveDirectory1, mainRenamedFileName));

			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}

			/* sub 이미지 */
			// sub이미지파일
			List<MultipartFile> fileList = mtfRequest.getFiles("subImg");
			for (MultipartFile f : fileList) {
				// 비어있는 MultipartFile객체가 전달된 경우(파일 하나만 업로드)
				// 파일이 없다면 밑에는 실행하지 말아라
				if (f.isEmpty())
					continue;
				// 파일 재생성 renamedFileName으로 저장하기
				String subOriginalFileName = f.getOriginalFilename();
				String subRenamedFileName = Utils.getRenamedFileName(subOriginalFileName);

				// 파일이동
				String saveDirectory2 = request.getServletContext().getRealPath("/resources/upload/shop/productSubImg");

				try {
					f.transferTo(new File(saveDirectory2, subRenamedFileName));

				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

				// 실제 파일데이터 originalFileName, renamedFileName을 db에 저장
				// Attachment객체
				Attachment attach2 = new Attachment();
				attach2.setOriginalImg(subOriginalFileName);
				attach2.setRenamedImg(subRenamedFileName);
				attach2.setProductId(product.getProductId());

				attachList.add(attach2);

			}
			log.debug("attachList={}", attachList);

			int result = adminProductService.insertProduct(product, attachList);
			
			redirectAttributes.addFlashAttribute("msg", result > 0 ? "등록성공!" : "등록실패");

		} catch (Exception e) {
			log.error("상품 등록 오류!", e);
	   		throw new ProductException("상품 등록 오류! 관리자에게 문의하세요");
		}

		return "redirect:/shop/admin/product/insert.do";
	}

}
