package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

/*
 * Interceptor - Spring MVC에서 Controller(spring에서는 Handler)들의 로직을 처리하기 위한 Component로 handler처리 전후로 호출된다
 * 
 * 구현
 * 1. Interceptor 클래스 생성
 * 		- HandlerInterceptor 를 implements(interface) : 모든 callback 메서드 overriding
 * 		- HandlerInterceptorAdapter를 extends(class) : 필요한 callback 메서드만 overriding
 * 		- voerriding callback 메서드
 * 			+ preHandle() - handler(Controller) 호출 전에 호출되는 메서드
 * 			+ postHandle() - handler(Controller) 처리 후에 호출되는 메서드
 * 			+ afterCompletion() - View가 실행 된 후에 호출되는 메서드(사용자 요청에 대한 모든 처리 종료 후 호출됨)
 * 
 * 2. Spring 설정파일에 등록
 * 	<mvc:interceptros> -> <mvc:interceptor> 태그를 이용해 등록
 * 		- Interceptor 클래스, 언제 호출될지(url 패턴)
 */

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	/**
	 *  매개변수
	 *  Object : 호출된 Controller객체
	 *  리턴값 : false - Controller를 호출하지 않는다
	 *  처리도중 Exception을 던지면 Controller로 이동하지 않는다
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();

		if (session.getAttribute("loginInfo") == null) {
			throw new ModelAndViewDefiningException(new ModelAndView(
					"/login.do", "message", "로그인이 필요한 서비스입니다"));
		}
		return true;
	}

	@Override
	/**
	 * 매개변수
	 * Object : 호출된 Controller객체
	 * ModelAndView : Controller가 리턴한 ModelAndView 객체
	 * 
	 * Controller에서 Exception을 던진 경우(비정상적으로 끝난 경우) 호출이 안된다
	 * 
	 */
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
//		System.out.println(
//				"Interceptor.postHandle() -" + modelAndView.getViewName());
	}

	@Override
	/**
	 * View까치 처리된 후에 호출되는 callback메서드
	 * 	- Controller나 View에서 예외를 발생시켜도 호출된다
	 * 
	 * 매개변수 
	 * Object : 호출된 Controller객체
	 * Exception : Controller나 View에서 Exception을 던진 경우 그 exception객체를 받는 변수
	 */
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
					throws Exception {
//		System.out.println("Interceptor.afterCompletion()------");
	}

}
