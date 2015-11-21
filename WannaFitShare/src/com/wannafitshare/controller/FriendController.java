package com.wannafitshare.controller;

import java.security.Provider.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wannafitshare.customer.service.CustomerService;

@Controller
@RequestMapping("/friendController")
public class FriendController {
	
	
	@Autowired
	private CustomerService service;

}
