package com.wannafitshare.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.SessionScope;

import com.wannafitshare.customer.exception.DuplicatedIdException;
import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.FriendList;

import common.validator.CustomerValidator;

/**
  * @RequestMapping - 요청 URL 등록
  * 				- 요청 url 등록  value="url" 
  * 			    - 요청 방식 등록 : method=GET/POST : RequestMethod 선언된 상수이용
  * 				- 생략 : get/post 모두 처리.	
  * hello.do로 url 경로로 post방식의 요청을 처리하는 handler(controller)메소드 ......
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService service;

	@RequestMapping("/login")
	public String login(@RequestParam String csId,
			@RequestParam String csPassword, HttpSession session) {
		String returnURL = "";

		Customer customer = service.loginCustomer(csId, csPassword);
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
	public String indexDo() {
		return "customer/customer_main.tiles";
	}
//
//	//고객 메인 컨트롤러 
//	@RequestMapping("/logincheck/customer_main")
//	public String customer_main() {
//		return "customer/customer_main.tiles";
//	}

	//고객 ID로 고객 조회 처리 Handler
	@RequestMapping("/findById")
	public String findById(@RequestParam String csId, ModelMap model) {
		Customer customer = service.findCustomerById(csId);
		model.addAttribute("customer", customer);
		return "customer/customer_info.tiles";
	}

	@RequestMapping("/logincheck//findByName")
	public String findByName(@RequestParam String csName, ModelMap model) {
		List<Customer> list = service.findCustomerByName(csName);
		model.addAttribute("namelist", list);
		return "customer/search_success.tiles";
	}

	//고객 List 조회처리 Handler

	@RequestMapping("/logincheck/list")
	public String list(@RequestParam(defaultValue = "1") String pageNo,
			ModelMap model) {
		int page = 1;
		try {
			page = Integer.parseInt(pageNo); //null일 경우 예외처리를 통해 page를 1로 처리한다..
		} catch (NumberFormatException e) {
		}
		Map attributes = service.getAllCustomersPaging(page);
		model.addAllAttributes(attributes);
		return "customer/list.tiles";
	}

	//고객 등록 처리 Handler

	@RequestMapping("/add")
	public String add(@ModelAttribute Customer customer, Errors errors,
			ModelMap model) throws DuplicatedIdException, SQLException {

		new CustomerValidator().validate(customer, errors);
		if (errors.hasErrors()) {
			return "customer/register_form.tiles";
		}
		service.addCustomer(customer);
		model.addAttribute("csId", customer.getCsId());
		return "redirect:/customer/registerSuccess.do";
	}

	@RequestMapping("/addFriendList")
	public String addFriendList(@RequestParam String friendId,
			 Error errors, ModelMap model ,HttpSession session)
					throws DuplicatedIdException, SQLException {
		
		
		Customer customer= (Customer) session.getAttribute("loginInfo");
		String id =customer.getCsId();
		FriendList friendList = new FriendList(id, friendId);
		service.addFriendList(friendList);
		System.out.println("=========================");
		
		List<String> list = service.findFriendListById(id);
		
		System.out.println("=========================");
		model.addAttribute("friendList", list);
		return "customer/friend_list.tiles";
	}

	//등록 후 성공페이지로 이동 처리.
	@RequestMapping("/registerSuccess")
	public String registerSuccess(@RequestParam String csId, ModelMap model) {

		model.addAttribute("customer", service.findCustomerById(csId));
		return "customer/register_success.tiles";
	}

	//로그인 회원 정보 수정
	@RequestMapping("/logincheck/modifyForm")
	public String modifyForm(HttpSession session, ModelMap model)
			throws Exception {

		Customer customer = (Customer) session.getAttribute("loginInfo");
//		System.out.println(customer + " modify폼");
		model.addAttribute("customer", customer);

		return "customer/modify_form.tiles";
	}

	//수정 처리 Handler
	@RequestMapping("/modify")
	public String modify(@ModelAttribute Customer customer, Errors errors,
			ModelMap model, HttpSession session) throws Exception {
		//Validator를 이용해 요청파라미터 체크
		new CustomerValidator().validate(customer, errors);

		if (errors.hasErrors()) {
			return "customer/modify_form.tiles";
		}
		service.updateCustomer(customer);
		Customer newCust = service.findCustomerById(customer.getCsId());
		session.setAttribute("loginInfo", newCust);
//		model.addAttribute("csId", customer.getCsId());
		return "customer/customer_main.tiles";
	}

	//고객 삭제 처리 HandlerattributeValue
	@RequestMapping("/logincheck/remove.do")
	public String remove(HttpSession session) throws Exception {
		//요청파라미터 검증
//		if (((String) session.getAttribute("csId")).trim().length() == 0) {
//			throw new Exception("삭제할 고객의 아이디가 없습니다.");
//		}

		Customer reCust = (Customer) session.getAttribute("loginInfo");
		String id = reCust.getCsId();

		//비지니스 로직 - 삭제처리(removeCustomer())
		System.out.println(id + "삭제할 아이디*-------");
		service.removeCustomer(id);
		//응답
		session.setAttribute("loginInfo", null);
		return "customer/byebye.tiles";
	}

	@RequestMapping("/idDuplicatedCheck")
	@ResponseBody
	public String idDuplicatedCheck(@RequestParam String csId) {
		Customer cust = service.findCustomerById(csId);
		return String.valueOf(cust != null); //중복인 경우 "true" 리턴
	}

}
