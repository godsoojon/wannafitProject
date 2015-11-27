package com.wannafitshare.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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

//	@Autowired
//	private PartyListService partyListservice;

	/*앨범 매뉴 클릭하면 party_index.jsp 로 이동*/
	@RequestMapping("/logincheck/party_index.do")
	public String goPartyIndex() {
		return "party/party_index.tiles";
	}

	/*앨범 만드는 makeParty_form.jsp 로 이동*/
	@RequestMapping("/logincheck/makeParty_form.do")
	public String goMakePartyForm() {
		return "party/makeParty_form.tiles";
	}

	/*앨범 만들기*/
	@RequestMapping("/logincheck/addParty.do")
	public String addParty(@RequestParam String partyName,
			@RequestParam int partyRight, ModelMap model, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Date date = new Date();
		Party party = new Party(partyName, id, partyRight, date);
		partyService.insertParty(party);
//		partyListservice.insertPartyList(id, partyName);
		model.addAttribute("party", party);
		return "party/party_info.tiles";
	}

	/* 내가 만든 앨범 보기*/
	@RequestMapping("/logincheck/belongParty.do")
	public String belongToParty(HttpSession session, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		List<String> list = partyService.belongParty(id);
		model.addAttribute("list", list);
		return "party/belong_party.tiles";
	}

	/*모든 앨범 보기*/
	@RequestMapping("/logincheck/allParty.do")
	public String allParty(ModelMap model) {
		List<String> list = partyService.selectAllParty();
		model.addAttribute("list", list);
		return "party/allParty.tiles";
	}

	/*가입하려는 파티 찾기*/
	@RequestMapping("/findParty.do")
	public String findParty(@RequestParam String partyName, ModelMap model) {
		partyService.selectPartyByName(partyName);
		Party party = partyService.selectPartyByName(partyName);
		model.addAttribute("party", party);
		return "party/party_info2.tiles";
	}

	/*앨범 보기*/
	@RequestMapping("/joinParty")
	public String joinParty(@ModelAttribute Party party, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();

		List<String> list = partyService.friendList(id);

		for (int k = 0; k < list.size(); k++) {
			System.out.println(list.get(k));
		}

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).equals(party.getCsId())) {
				return "party/test.tiles";
			} else
				return "/friendController/logincheck/search_name.do";
		}

		System.out.println(party);
//		partyListservice.insertPartyList(id, partyName);
		return "/friendController/logincheck/search_name.do";
	}

//	/*내가 속한 앨범 목록 보기*/
//	@RequestMapping("/logincheck/belongParty.do")
//	public String belongToParty(HttpSession session, ModelMap model) {
//		Customer customer = (Customer) session.getAttribute("loginInfo");
//		String id = customer.getCsId();
//		List<String> list = partyListservice.belongParty(id);
//		model.addAttribute("list", list);
//		return "party/belong_party.tiles";
//	}

}
