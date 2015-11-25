package com.wannafitshare.controller;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.customer.service.FriendListService;
import com.wannafitshare.customer.service.PartyService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.FriendList;
import com.wannafitshare.vo.Party;

@Controller
@RequestMapping("/partyController")
public class PartyController {

	@Autowired
	private PartyService partyService;
	
	@Autowired
	private FriendListService fService;
	
	@Autowired
	private CustomerService cService;
	
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
		
		System.out.println("-------t삽입전");
		partyService.insertParty(party);
		
		System.out.println("-------t삽입후");
//		partyListservice.insertPartyList(id, partyName);
		model.addAttribute("party", party);
		return "party/party_info.tiles";
	}

/*	내가 속한 앨범 목록 보기
	@RequestMapping("/logincheck/belongParty.do")
	public String belongToParty(HttpSession session, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		List<String> list = partyService.belongParty(id);
		model.addAttribute("list", list);
		return "party/belong_party.tiles";
	}*/

	/*모든 앨범 보기*/
	@RequestMapping("/logincheck/allParty.do")
	public String allParty(ModelMap model) {
		List<String> list = partyService.selectAllParty();
		model.addAttribute("list", list);
		return "party/allParty.tiles";
	}

	/*가입하려는 파티 찾기*/
	@RequestMapping("/findParty.do")
	public String findParty(@RequestParam String partyName, ModelMap model,HttpSession session) {
		System.out.println(partyName);
//		partyService.selectPartyByName(partyName);
		Party party = partyService.selectPartyByName(partyName);
		String URL="";
		System.out.println("========================에러잡기");
		if(party.getPartyRight()==1){
			System.out.println("========================에러잡기");
			model.addAttribute(party);
			URL="party/party_info2.tiles";
			System.out.println("========================에러잡기");
		}else if(party.getPartyRight()==2){
			//2번 친구만 보기이면 지금 로그인 한사람의 아이디와 파티짱의 아이디와 친구인지
			System.out.println("========================에러잡기");
			Customer customer = (Customer) session.getAttribute("loginInfo");
			String id = customer.getCsId();
			//친구리스트 디비가서 둘의 정보가 있는지 확인
			FriendList list =new FriendList(id,party.getCsId());
			
			FriendList list2=fService.findFriend(list);
			System.out.println("========================에러잡기");
			if(list2==null){
				JOptionPane.showMessageDialog(null, "친구만 볼수있는 앨범입니다.");
				Customer customer1 =cService.findCustomerById(party.getCsId());
				model.addAttribute("customer",customer1);
				URL="customer/customer_info.tiles";
				System.out.println("=======================리스트없음");
			}else{
				URL="party/party_info2.tiles";
				System.out.println("=======================리스트있음");
			}	
			//검사하고 친구이면 보이고 친구아니면 파티짱 정보로 가서 친구추가할수있게 
		}else{
			//3번 나만보기로 되어있으면 볼수없음 다시 allparty로 감/팝업으로 나만보기로 되어잇다고 표시
			JOptionPane.showMessageDialog(null, "볼수없는 앨범입니다!!!");
			URL="redirect:/partyController/logincheck/allParty.do";
			System.out.println("========================에러잡기");
		}
		
		model.addAttribute("party", party);
		return URL;
	}

	/*파티 가입하기*/
//	@RequestMapping("/joinParty")
//	public String joinParty(@RequestParam String partyName,
//			HttpSession session) {
//		Customer customer = (Customer) session.getAttribute("loginInfo");
//		String id = customer.getCsId();
//		partyListservice.insertPartyList(id, partyName);
//		return "";
//
//	}
}
