package com.wannafitshare.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.customer.service.LoginService;
import com.wannafitshare.vo.Customer;

@Controller
@RequestMapping("/loginController")
public class LoginController {

	@Autowired
	private CustomerService service;

	@Autowired
	private LoginService loginService;

	@RequestMapping("/login")
	public String login(@RequestParam String csId,
			@RequestParam String csPassword, HttpSession session) {
		String returnURL = "";

		Customer customer = loginService.loginCustomer(csId, csPassword);
//		System.out.println(customer);

		if (customer == null) {
			returnURL = "/index.do";
		} else if (customer.getCsId().equals(csId)
				&& customer.getCsPassword().equals(csPassword)) {//아이디,비번 비교
//			System.out.println(customer);
			session.setAttribute("loginInfo", customer);
//			returnURL = "redirect:/customer/customer_main.do";
			returnURL = "customer/customer_main.tiles";
		} else {
			returnURL = "/index.do";//패스워드 틀리면 로그인 페이지로 이동 index.jsp
		}
		return returnURL;
	}

	@RequestMapping("/logincheck/logout")
	public String logout(HttpSession session) {
		session.setAttribute("loginInfo", null);
		return "/index.do";

	}

	@RequestMapping("/logincheck/home.do")
	public String goHome() {
		return "customer/customer_main.tiles";
	}
}
