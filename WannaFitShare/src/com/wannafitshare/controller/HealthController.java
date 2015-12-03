package com.wannafitshare.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wannafitshare.customer.service.HealthService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Health;



@Controller
@RequestMapping("/health")
public class HealthController {

	@Autowired
	private HealthService hService;

	@RequestMapping("/logincheck/healthForm")
	public String healthForm(HttpSession session, ModelMap model) {
		String URL = "";
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String csId = customer.getCsId();

		Health health = hService.findHealthById(csId);

		if (health == null) {
			URL = "customer/health_form.tiles";
		} else {
			model.addAttribute("health", health);
			URL = "customer/health_success.tiles";
		}
		return URL;
	}

	@RequestMapping("/addHealth")
	public String addHealth(HttpSession session, ModelMap model,
			@ModelAttribute Health health, Errors errors) {

		int hTall = (int) health.gethTall();
		int hWeight = (int) health.gethWeight();
		double weight = health.gethWeight();
		double hBmi = 0;
		if (hTall != 0 && hWeight != 0) {
			hBmi = weight / (health.gethTall() * health.gethTall());
			hBmi=hBmi*10000;
			health.sethBmi(hBmi);

		}

		hService.addHealth(health);
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Health h = hService.findHealthById(id);
		model.addAttribute("friendList", h);
		return "customer/health_success.tiles";

	}

	@RequestMapping("/healthModify")
	public String healthModify(HttpSession session, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Health health = hService.findHealthById(id);

		model.addAttribute("health", health);
		return "customer/health_modify.tiles";

	}

	@RequestMapping("/modifyHealth")
	public String modifyHealth(HttpSession session, ModelMap model,
			@ModelAttribute Health health,Errors errors) {
		System.out.println("modifyHealth 컨트롤러 들어옴");
		
		int hTall = (int) health.gethTall();
		int hWeight = (int) health.gethWeight();
		double weight = health.gethWeight();
		double hBmi = 0;
		if (hTall != 0 && hWeight != 0) {
			hBmi = weight / (health.gethTall() * health.gethTall());
			hBmi=hBmi*10000;
			health.sethBmi(hBmi);

		}
		System.out.println("2");
		hService.updateHealth(health);

		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Health h = hService.findHealthById(id);
		System.out.println("3");
		model.addAttribute("health", h);
		return "customer/health_success.tiles";

	}

}

