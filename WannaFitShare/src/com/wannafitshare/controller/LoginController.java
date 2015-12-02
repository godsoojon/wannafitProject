package com.wannafitshare.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.customer.service.LoginService;
import com.wannafitshare.vo.Customer;

import common.validator.LoginValidator;

@Controller
@RequestMapping("/loginController")
public class LoginController {

	@Autowired
	private CustomerService service;

	@Autowired
	private LoginService loginService;

	@Autowired
	private CustomerService custService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Customer customer, Errors errors,
			HttpSession session) {
		System.out.println(customer);
		String returnURL = "";
		LoginValidator validate = new LoginValidator();
		validate.validate(customer, errors);
		if (errors.hasErrors()) {//true - 오류가 있다
			return "/index.do";
		}

		Customer findCustomer = custService
				.findCustomerById(customer.getCsId());

		if (findCustomer == null) {
			returnURL = "/index.do";
		} else if (findCustomer.getCsId().equals(customer.getCsId())
				&& findCustomer.getCsPassword()
						.equals(customer.getCsPassword())) {//아이디,비번 비교
			session.setAttribute("loginInfo", findCustomer);
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
	
	@RequestMapping("/findId.do")
	public String findId(@RequestParam String csPhone,ModelMap model){
		Customer customer=service.findCustomerByPhone(csPhone);
		model.addAttribute("customer1", customer);
		return "customer/search_id_success.tiles";
	}
}
