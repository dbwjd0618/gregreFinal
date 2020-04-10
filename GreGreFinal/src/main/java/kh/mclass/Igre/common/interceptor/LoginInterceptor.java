package kh.mclass.Igre.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kh.mclass.Igre.member.model.vo.BizMember;
import kh.mclass.Igre.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static Logger logger = LoggerFactory.getLogger(LoggerInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession ss = request.getSession();
		Member memberLoggedIn = (Member)ss.getAttribute("memberLoggedIn");
		BizMember bizmemberLoggedIn = (BizMember)ss.getAttribute("bizmemberLoggedIn");
		logger.debug("memberLoggedIn = " + memberLoggedIn);
		logger.debug("bizmemberLoggedIn = " + bizmemberLoggedIn);
		if(memberLoggedIn == null && bizmemberLoggedIn==null) {
			ss.setAttribute("msg", "로그인 후 이용해주세요");
			response.sendRedirect(request.getHeader("referer"));
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
	

	
}
