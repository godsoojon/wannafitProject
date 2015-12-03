package com.wannafitshare.controller;

import javax.swing.JOptionPane;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.exception.DuplicatedIdException;
import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.customer.service.FriendListService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.FriendList;

@Controller
@RequestMapping("/friendController")
public class FriendController {

	@Autowired
	private FriendListService friendService;

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/logincheck/search_name")
	public String goSearchName(HttpSession session) {
		return "customer/search_name.tiles";
	}

	@RequestMapping("/logincheck/findByName")
	public String findByName(@RequestParam String csName, ModelMap model) {
		List<Customer> list = customerService.findCustomerByName(csName);
		model.addAttribute("namelist", list);
		return "customer/search_success.tiles";
	}

	//고객 아이디로 찾기
	@RequestMapping("/findById")
	public String findById(@RequestParam String csId, ModelMap model) {
		Customer customer = customerService.findCustomerById(csId);
		model.addAttribute("customer", customer);
		return "customer/customer_info.tiles";
	}

	@RequestMapping("/deleteFriendList")
	public String deleteFriendList(@RequestParam String friendId, Error errors,
			ModelMap model, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		FriendList list = new FriendList(id, friendId);
		friendService.deleteFriendList(list);
		JOptionPane.showMessageDialog(null, "삭제되었습니.다");
		List<String> list1 = friendService.findFriendListById(id);
		model.addAttribute("friendList", list1);
		return "customer/friend_list.tiles";

	}

	@RequestMapping("/myFriend")
	public String myFriend(HttpSession session, Error errors, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		List<String> list = friendService.findFriendListById(id);
		model.addAttribute("friendList", list);
		session.setAttribute("seionFriendList", list);
		return "customer/friend_list.tiles";
	}

	@RequestMapping("/addFriendList")
	public String addFriendList(@RequestParam String friendId, Error errors,
			ModelMap model, HttpSession session)
					throws DuplicatedIdException, SQLException {
		String URL = "";
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		System.out.println(friendId);
		FriendList friendList = new FriendList(id, friendId);
		FriendList friendList2 = new FriendList(friendId, id);
		FriendList fl = friendService.findFriend(friendList);
		FriendList fl2 = friendService.findFriend(friendList2);
		if (fl == null) {
			friendService.addFriendList(friendList);
			List<String> list = friendService.findFriendListById(id);
			model.addAttribute("friendList", list);
			URL = "customer/friend_list.tiles";
			System.out.println(fl);
		} else {
			//이미친구일때 팝업창.
			System.out.println(fl);
			JOptionPane.showMessageDialog(null, "이미친구입니다..");
			List<String> list = friendService.findFriendListById(id);
			model.addAttribute("friendList", list);
			URL = "customer/friend_list.tiles";
		}return URL;}

}
