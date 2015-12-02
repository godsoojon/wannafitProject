package com.wannafitshare.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionIdListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;

import com.wannafitshare.customer.service.PartyService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.Party;

import common.validator.LoginValidator;
import common.validator.PartyValidator;

@Controller
@RequestMapping("/partyController")
public class PartyController {

	@Autowired
	private PartyValidator validate;

	@Autowired
	private PartyService partyService;

//   @Autowired
//   private PartyListService partyListservice;

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


		validate.validate(party, errors);
		if (errors.hasErrors()) {
			return "party/makeParty_form.tiles";
		}

		partyService.insertParty(party);
//      partyListservice.insertPartyList(id, partyName);
		model.addAttribute("party", party);
		return "party/party_info.tiles";
	}

	/* 내가 만든 앨범 보기*/
	@RequestMapping("/logincheck/belongParty.do")
	public String belongToParty(HttpSession session, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		List<Party> list = partyService.selectPartyBycsId(id);
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

	/*다른사람 파티 보러가기 -정보 출력*/
	@RequestMapping("/goParty.do")
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
		}

//      partyListservice.insertPartyList(id, partyName);
		return "/friendController/logincheck/search_name.do";
	}

	@RequestMapping("/deleteParty.do")
	public String deleteParty(@RequestParam String partyName) {
		partyService.deleteParty(partyName);

		return "/partyController/logincheck/belongParty.do";

	}

	/*내 앨범 보기*/
	@RequestMapping("/logincheck/myparty.do")
	public String myParty(@RequestParam String partyName, HttpSession session,
			ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		Party party = partyService.selectPartyByName(partyName);
		session.setAttribute("party", party.getPartyName());
		return "/album/logincheck/see.do";
	}

	/*파티 수정폼으로 가기*/
	@RequestMapping("/logincheck/goUpdateParty.do")
	public String goUpdateParty(@RequestParam String partyName,
			HttpSession session) {
		System.out.println(partyName + "---- goUpdateParty.do");
		session.setAttribute("party", partyName);
		return "party/modify_fiorm.tiles";
	}

	@RequestMapping("/logincheck/updateParty.do")
	public String updateParty(@RequestParam int partyRight,
			HttpSession session) {
		String partyName = (String) session.getAttribute("party");
		System.out.println(partyName + " ---- updateParty.do");
		System.out.println(partyRight + " ---- updateParty.do");
		partyService.updatePartyRight(partyName, partyRight);
		return "/partyController/logincheck/belongParty.do";
	}
}