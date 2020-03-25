//package kh.mclass.Igre.common.aop;
//
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.Signature;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Pointcut;
//import org.springframework.stereotype.Component;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Component
//@Aspect
//@Slf4j
//public class LoggerAspectAnno {
//	
//	@Pointcut("execution(* com.kh.spring.memo..*(..))")
//	public void pointcut() {
//		
//	}
//
//	//AroundAdvice 테스트
//	@Around("pointcut()")
//	public Object loggerAdvice(ProceedingJoinPoint pjp) throws Throwable{
//		
//		Signature sn = pjp.getSignature();
//		String type = sn.getDeclaringTypeName(); //클래스
//		String methodName = sn.getName();
//		
//		
//		log.debug("[Before] {}.{}", type, methodName);
//		
//		Object obj = pjp.proceed();
//		
//		log.debug("[After] {}.{}", type, methodName);
//		
//		return obj;
//	}
//}
