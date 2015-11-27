package com.wannafitshare.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.HealthService;
import com.wannafitshare.vo.Customer;

import com.wannafitshare.vo.Health;

@Controller
@RequestMapping("/health")
public class HealthController {

	@Autowired
	private HealthService hService;
	
	
	
	
	@RequestMapping("/logincheck/healthForm")
	public String healthForm(HttpSession session,ModelMap model){
		String URL ="";
		Customer customer=(Customer)session.getAttribute("loginInfo");
		String csId=customer.getCsId();
		
		Health health =hService.findHealthById(csId);
		
		if(health==null){
			URL="customer/health_form.tiles"; 
		}else{
			model.addAttribute("health",health);
			URL="customer/health_success.tiles";
		}
		return URL;
	}
	
	
	@RequestMapping("/addHealth")
	public String addHealth(HttpSession session, ModelMap model ,@ModelAttribute Health health){
	
	
		hService.addHealth(health);
		
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		
		
		
		Health h = hService.findHealthById(id);
		model.addAttribute("friendList",h);
		return "customer/health_success.tiles";
		
	}

	@RequestMapping("/healthModify")
	public String healthModify(HttpSession session, ModelMap model){
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Health health =hService.findHealthById(id);
		
		model.addAttribute("health",health);
		return "customer/health_modify.tiles";
		
		
		
	}
	@RequestMapping("/modifyHealth")
	public String modifyHealth(HttpSession session,ModelMap model, @ModelAttribute Health health){
		System.out.println("---------등록전");
		hService.updateHealth(health);
		System.out.println("---------등록후");
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Health h = hService.findHealthById(id);
		
		model.addAttribute("health",h);
		return "customer/health_success.tiles";
		
	}
	
	

}
