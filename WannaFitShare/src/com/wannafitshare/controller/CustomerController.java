package com.wannafitshare.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wannafitshare.customer.exception.DuplicatedIdException;
import com.wannafitshare.customer.service.CalorieCalendarService;
import com.wannafitshare.customer.service.CalorieCalendarServiceImpl;
import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.customer.service.FriendListService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.FriendList;

import common.util.CalDayMonth;
import common.validator.CustomerModifyValidator;
import common.validator.CustomerValidator;

/**
 * @RequestMapping - 요청 URL 등록 - 요청 url 등록 value="url" - 요청 방식 등록 :
 *                 method=GET/POST : RequestMethod 선언된 상수이용 - 생략 : get/post 모두
 *                 처리. hello.do로 url 경로로 post방식의 요청을 처리하는 handler(controller)메소드
 *                 ......
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerValidator validate;

	@Autowired
	private CustomerModifyValidator validateModify;

	@Autowired
	private CustomerService service;

	@Autowired
	private FriendListService friendService;

	//고객 아이디로 찾기
	@RequestMapping("/findById")
	public String findById(@RequestParam String csId, ModelMap model) {
		Customer customer = service.findCustomerById(csId);
		model.addAttribute("customer", customer);
		return "customer/customer_info.tiles";
	}

	// 고객 List 조회처리 Handler
	@RequestMapping("/logincheck/list")
	public String list(@RequestParam(defaultValue = "1") String pageNo,
			ModelMap model) {
		int page = 1;
		try {
			page = Integer.parseInt(pageNo); // null일 경우 예외처리를 통해 page를 1로
											// 처리한다..
		} catch (NumberFormatException e) {
		}
		Map attributes = service.getAllCustomersPaging(page);
		model.addAllAttributes(attributes);
		return "customer/list.tiles";
	}

	@RequestMapping("/logincheck/calender")
	public String calender(@RequestParam String mode, @RequestParam String year,
			@RequestParam String month, @RequestParam String day,
			ModelMap model, HttpSession session)
					throws DuplicatedIdException, SQLException {
		ArrayList<String> row1 = new ArrayList<String>();
		ArrayList<String> row2 = new ArrayList<String>();
		ArrayList<String> row3 = new ArrayList<String>();
		ArrayList<String> row4 = new ArrayList<String>();
		ArrayList<String> row5 = new ArrayList<String>();
		ArrayList<String> row6 = new ArrayList<String>();
		ArrayList<String> temp = new ArrayList<String>();
		Calendar currentCalendar = null;
		CalorieCalendarService service1 = new CalorieCalendarServiceImpl();
		// List<CalorieCalendar> cc = service1.selectAll();
		int currentYear = 0;
		int currentMonth = 0;
		if (mode.equals("0")) {
			currentCalendar = new GregorianCalendar();
			currentYear = currentCalendar.get(Calendar.YEAR);
			currentMonth = currentCalendar.get(Calendar.MONTH) + 1;
			System.out.println(currentCalendar);
		} else if (mode.equals("1")) {
			System.out.println(year + "----" + month + "----" + day);
			currentYear = Integer.parseInt(year) - 1;
			currentMonth = Integer.parseInt(month);
			currentCalendar = new GregorianCalendar(currentYear,
					currentMonth - 1, Integer.parseInt(day));
			System.out.println(currentCalendar);
		} else if (mode.equals("2")) {
			System.out.println(year + "----" + month + "----" + day);
			currentYear = Integer.parseInt(year) + 1;
			currentMonth = Integer.parseInt(month);
			currentCalendar = new GregorianCalendar(currentYear,
					currentMonth - 1, Integer.parseInt(day));
			System.out.println(currentCalendar);
		} else if (mode.equals("3")) {
			System.out.println(year + "----" + month + "----" + day);
			currentYear = Integer.parseInt(year);
			currentMonth = Integer.parseInt(month) - 1;
			if (currentMonth == 0) {
				currentMonth = 1;
			}
			if (currentMonth == 13) {
				currentMonth = 12;
			}
			currentCalendar = new GregorianCalendar(currentYear,
					currentMonth - 1, Integer.parseInt(day));
			System.out.println(currentCalendar);

		} else if (mode.equals("4")) {
			System.out.println(year + "----" + month + "----" + day);
			currentYear = Integer.parseInt(year);
			currentMonth = Integer.parseInt(month) + 1;
			if (currentMonth == 0) {
				currentMonth = 1;
			}
			if (currentMonth == 13) {
				currentMonth = 12;
			}
			currentCalendar = new GregorianCalendar(currentYear,
					currentMonth - 1, Integer.parseInt(day));
			System.out.println(currentCalendar);
		}

		Calendar calCalendar = new GregorianCalendar();

		calCalendar.set(currentCalendar.get(Calendar.YEAR), currentMonth - 1,
				1);
		int week = calCalendar.get(Calendar.DAY_OF_WEEK);

		for (int i = 0; i < week - 1; i++) {
			temp.add("");
		}
		;
		for (int i = 1; i <= CalDayMonth.calDay(currentMonth,
				calCalendar.get(Calendar.YEAR)); i++) {
			temp.add(i + "");
		}
		for (int i = temp.size(); i <= 42; i++) {
			temp.add("");
		}
		for (int i = 0; i < 7; i++) {
			row1.add(temp.get(i));
			row2.add(temp.get(i + 7));
			row3.add(temp.get(i + 14));
			row4.add(temp.get(i + 21));
			row5.add(temp.get(i + 28));
			row6.add(temp.get(i + 35));
		}
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		model.addAttribute("csId", id);
		model.addAttribute("year", currentYear);
		model.addAttribute("month", currentMonth);
		model.addAttribute("row1", row1);
		model.addAttribute("row2", row2);
		model.addAttribute("row3", row3);
		model.addAttribute("row4", row4);
		model.addAttribute("row5", row5);
		model.addAttribute("row6", row6);
		return "customer/calender.tiles";
	}

	// 고객 등록 처리 Handler
	//TODO 
	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public String add(@ModelAttribute Customer customer, Errors errors,
			ModelMap model) throws DuplicatedIdException, SQLException {
		validate.validate(customer, errors);
		if (errors.hasErrors()) {
			return "customer/register_form.do";
		}

		service.addCustomer(customer);

		//회원가입 하고 내친구 리스트에 자기 정보 추가하기
		String id = customer.getCsId();
		String picture = "basic.png";
		FriendList friendList = new FriendList(id,id,picture);
		friendService.addFriendList(friendList);
		System.out.println("자기정보등록 성공");
		model.addAttribute("csId", customer.getCsId());
		return "redirect:/customer/registerSuccess.do";

	}

	// 등록 후 성공페이지로 이동 처리.
	@RequestMapping("/registerSuccess")
	public String registerSuccess(@RequestParam String csId, ModelMap model) {

		model.addAttribute("customer", service.findCustomerById(csId));
		return "customer/register_success.tiles";
	}

	// 로그인 회원 정보 수정
	@RequestMapping("/logincheck/modifyForm")
	public String modifyForm(HttpSession session, ModelMap model)
			throws Exception {

		Customer customer = (Customer) session.getAttribute("loginInfo");
		// System.out.println(customer + " modify폼");
		model.addAttribute("customer", customer);

		return "customer/modify_form.tiles";
	}

	// 수정 처리 Handler
	@RequestMapping("/modify")
	public String modify(@ModelAttribute Customer customer, Errors errors,
			ModelMap model, HttpSession session) throws Exception {
		validateModify.validate(customer, errors);
		if (errors.hasErrors()) {
			return "customer/modify_form.tiles";
		}
		service.updateCustomer(customer);
		Customer newCust = service.findCustomerById(customer.getCsId());
		session.setAttribute("loginInfo", newCust);
		return "customer/customer_main.tiles";
	}

	// 고객 삭제 처리 HandlerattributeValue
	@RequestMapping("/logincheck/remove.do")
	public String remove(HttpSession session) throws Exception {

		Customer reCust = (Customer) session.getAttribute("loginInfo");
		String id = reCust.getCsId();

		// 비지니스 로직 - 삭제처리(removeCustomer())
		System.out.println(id + "삭제할 아이디*-------");
		service.removeCustomer(id);
		// 응답
		session.setAttribute("loginInfo", null);
		session.setAttribute("party", null);
		return "/login.do";
	}

	@RequestMapping("/idDuplicatedCheck")
	@ResponseBody
	public String idDuplicatedCheck(@RequestParam String csId) {
		Customer cust = service.findCustomerById(csId);
		return String.valueOf(cust != null); // 중복인 경우 "true" 리턴
	}

	@RequestMapping("/logincheck/findByName")
	public String findByName(@RequestParam String csName, ModelMap model) {
		List<Customer> list = service.findCustomerByName(csName);
		model.addAttribute("namelist", list);
		return "customer/search_success.tiles";
	}

}
