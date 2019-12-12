package com.java.aop;

import java.util.logging.Logger;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 9.
 * @설명 : advice   
 */

@Component
@Aspect
public class JejuAspect {
	public static Logger logger = Logger.getLogger(JejuAspect.class.getName());
	public static final String logMsg = "LogMsg--------------";
	
	@Around(value = "within(com.java..*)")
	public Object advice(ProceedingJoinPoint joinPoint) throws Throwable{
		Object obj = null;
		try {
			logger.info(logMsg+joinPoint.getTarget().getClass().getName()+"\t\t"+joinPoint.getSignature().getName());
			
			obj = joinPoint.proceed();
			
		}catch(Throwable e){
			e.printStackTrace();
		}
		return obj;
	}
}
