package kh.mclass.Igre.common.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import lombok.extern.slf4j.Slf4j;

@WebListener
@Slf4j
public class VisitCount implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		log.debug("세션생성");
		System.out.println("sssssssssssssssssssssssssss");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		log.debug("세션해제");
		System.out.println("nnnnnnnnnnnnnnnnnnnnnnnnn");
	}
	

}
