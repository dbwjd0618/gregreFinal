//package kh.mclass.Igre.common.aop;
//
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Pointcut;
//import org.springframework.stereotype.Component;
//import org.springframework.util.StopWatch;
//
//import lombok.extern.slf4j.Slf4j;
//
///**
// * memo패키지의 insertMemo의 실행시간을 구하세요
// *
// * org.springFramewor.util.Stopwatch
// */
//
//@Component
//@Aspect
//@Slf4j
//public class RuntimeCheckAspect {
//	
//	@Pointcut("execution(* com.kh.spring.memo.controller.MemoController.insert(..))")
//	public void pointcut() {
//		
//	}
//	
//	@Around("pointcut()")
//	public Object loggerAdvice(ProceedingJoinPoint pjp) throws Throwable {
//		
//		StopWatch sw = new StopWatch();
//		sw.start();
//		Object obj = pjp.proceed();
//		sw.stop();
//		log.debug("sw millis = "+sw.getTotalTimeMillis());
//		
//		return obj;
//	}
//}
