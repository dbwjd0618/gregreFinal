//package kh.mclass.Igre.common.aop;
//
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.Signature;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//public class LoggerAspect {
//
//	//AroundAdvice 테스트
//	public Object loggerAdvice(ProceedingJoinPoint pjp) throws Throwable{
//		
//		Signature sn = pjp.getSignature();
//		String type = sn.getDeclaringTypeName(); //클래스
//		String methodName = sn.getName();
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
