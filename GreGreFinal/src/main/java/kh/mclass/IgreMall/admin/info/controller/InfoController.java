package kh.mclass.IgreMall.admin.info.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.mclass.IgreMall.admin.info.model.service.InfoService;
import kh.mclass.IgreMall.admin.info.model.vo.ShopAdmin;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shop/admin")
public class InfoController {
	@Autowired
	InfoService infoService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@RequestMapping("/update.do")
	public ModelAndView adminUpdate(ModelAndView mav,ShopAdmin s) {
		
		int result = infoService.updateAdmin(s);
		
		mav.setViewName("redirect:/shop/admin/index.do");
		return mav;
	}
	
}
