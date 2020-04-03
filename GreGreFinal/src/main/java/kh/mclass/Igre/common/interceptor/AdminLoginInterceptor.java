package kh.mclass.Igre.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.member.model.vo.Member;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {

	private static Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession ss = request.getSession();
		Admin adminLoggedIn = (Admin)ss.getAttribute("adminLoggedIn");
		logger.debug("adminLoggedIn = " + adminLoggedIn);
		if(adminLoggedIn == null) {
			ss.setAttribute("msg", "로그인 후 이용해주세요");
			response.sendRedirect(request.getContextPath()+"/admin/login.do");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
	
}
