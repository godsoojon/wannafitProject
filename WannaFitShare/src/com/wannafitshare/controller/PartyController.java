package com.wannafitshare.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.PartyService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Party;

import common.validator.PartyValidator;

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
	public String addParty(@ModelAttribute Party party, Errors errors,
			ModelMap model, HttpSession session) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Date date = new Date();
		party.setCsId(id);
		party.setPartyDate(date);
		System.out.println(party + "-----파티 추가 컨드롤러");

		PartyValidator validate = new PartyValidator();
		validate.validate(party, errors);
		if (errors.hasErrors()) {
			return "party/makeParty_form.tiles";
		}

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
		String URL ="";
		List<String> list = partyService.friendList(id);

		int partyR = party.getPartyRight();
		
		if (partyR == 3) {
			session.setAttribute("party", party.getPartyName());
			return "/album/logincheck/see.do";

		} else if (partyR == 2) {

			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).equals(party.getCsId())) {
					session.setAttribute("party", party.getPartyName());
					return "/album/logincheck/see.do";

				}
			}
		
			return "/friendController/logincheck/search_name.do";
		}

	

		


//		partyListservice.insertPartyList(id, partyName);
		return "/friendController/logincheck/search_name.do";
	}
	
	@RequestMapping("/logincheck/myparty.do")
	   public String myParty(@RequestParam String partyName, HttpSession session,
	         ModelMap model) {
	      Customer customer = (Customer) session.getAttribute("loginInfo");
	      String id = customer.getCsId();
	      Party party = partyService.selectPartyByName(partyName);
	      session.setAttribute("party", party.getPartyName());
	      return "party/test.tiles";
	   }

	@RequestMapping("/deleteParty.do")
	public String deleteParty(@RequestParam String partyName){
		partyService.deleteParty(partyName);
		
		return "/partyController/logincheck/belongParty.do";
		
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
