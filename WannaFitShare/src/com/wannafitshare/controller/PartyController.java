package com.wannafitshare.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.PartyService;
import com.wannafitshare.vo.Party;

@Controller
@RequestMapping("/partyController")
public class PartyController {

	@Autowired
	private PartyService service;

	@RequestMapping("/logincheck/makeParty_form.do")
	public String goMakePartyForm() {
		return "customer/makeParty_form.tiles";
	}

	@RequestMapping("/logincheck/addParty.do")
	public String addParty(@RequestParam String partyName,
			@RequestParam int partyRight, ModelMap model) {

		Date date = new Date();
		Party party = new Party(partyName, partyRight, date, 1);
		service.insertParty(party);
		model.addAttribute("party", party);

		return "customer/party_info.tiles";
	}

}
