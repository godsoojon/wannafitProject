package com.wannafitshare.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.PartyListService;
import com.wannafitshare.customer.service.PartyService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Party;

@Controller
@RequestMapping("/partyController")
public class PartyController {

	@Autowired
	private PartyService partyService;

	@Autowired
	private PartyListService partyListservice;

	@RequestMapping("/logincheck/party_index.do")
	public String goPartyIndex() {
		return "customer/party_index.tiles";
	}

	@RequestMapping("/logincheck/makeParty_form.do")
	public String goMakePartyForm() {
		return "customer/makeParty_form.tiles";
	}

	@RequestMapping("/logincheck/addParty.do")
	public String addParty(@RequestParam String partyName,
			@RequestParam int partyRight, ModelMap model, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Date date = new Date();
		Party party = new Party(partyName, partyRight, date, 1, id);
		partyService.insertParty(party);
		partyListservice.insertPartyList(id, partyName);
		model.addAttribute("party", party);

		return "customer/party_info.tiles";
	}

	@RequestMapping("/logincheck/belongParty.do")
	public String belongToParty(HttpSession session, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		List<String> list = partyListservice.belongParty(id);
		model.addAttribute("list", list);
//		model.addAllAttributes(list);
		return "customer/belong_party.tiles";
	}

}
