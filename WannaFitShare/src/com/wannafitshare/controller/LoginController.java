package com.wannafitshare.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.wannafitshare.customer.service.CustomerService;
import com.wannafitshare.customer.service.FriendListService;
import com.wannafitshare.customer.service.LoginService;
import com.wannafitshare.vo.Customer;

import common.validator.LoginValidator;

@Controller
@RequestMapping("/loginController")
public class LoginController {

	@Autowired
	private LoginValidator validate;

	@Autowired
	private CustomerService service;

	@Autowired
	private LoginService loginService;

	@Autowired
	private CustomerService custService;

	@Autowired
	private FriendListService friendService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute Customer customer, Errors errors,
			HttpSession session) {
		String returnURL = "";
		validate.validate(customer, errors);
		if (errors.hasErrors()) {//true - 오류가 있다
			return "/login.do";
		}

		Customer findCustomer = custService
				.findCustomerById(customer.getCsId());

		if (findCustomer == null) {
			returnURL = "/login.do";

		} else if (findCustomer.getCsId().equals(customer.getCsId())
				&& findCustomer.getCsPassword()
						.equals(customer.getCsPassword())) {//아이디,비번 비교
			session.setAttribute("loginInfo", findCustomer);
//         returnURL = "redirect:/customer/customer_main.do";
//         returnURL = "customer/customer_main.tiles";
			returnURL = "/loginController/logincheck/home.do";
		} else {
			returnURL = "/login.do";//패스워드 틀리면 로그인 페이지로 이동 index.jsp
		}
		return returnURL;
	}

	@RequestMapping("/logincheck/logout.do")
	public String logout(HttpSession session) {
		session.setAttribute("loginInfo", null);
		session.setAttribute("seionFriendList", null);
		session.setAttribute("party", null);
		return "/login.do";

	}
	
	@RequestMapping("/lock.do")
	public String lock(HttpSession session,@RequestParam String csPassword){
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		String pw = customer.getCsPassword();
	
		if(pw.equals(csPassword)){
		
			return "/loginController/logincheck/home.do";
		}
		return "/WEB-INF/view/section/lock_screen.jsp";
	}

	@RequestMapping("/logincheck/home.do")
	public String goHome(HttpSession session, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		List<String> list = friendService.findFriendListById(id);

		session.setAttribute("seionFriendList", list);

		//return "customer/customer_main.tiles";
		return "redirect:/home1.do";
	}

	@RequestMapping("/logincheck/home1.do")
	public String goHome1(HttpSession session, ModelMap model) {
		Customer customer = (Customer) session.getAttribute("loginInfo");
		String id = customer.getCsId();
		List<String> list = friendService.findFriendListById(id);

		session.setAttribute("seionFriendList", list);

		return "redirect:/customer/customer_main.tiles";
	}

	@RequestMapping("/findId.do")
	public String findId(@RequestParam String csPhone, ModelMap model) {
		Customer customer = service.findCustomerByPhone(csPhone);
		model.addAttribute("customer1", customer);
		return "customer/search_id_success.tiles";
	}

	@RequestMapping("/logincheck/singleup.do") //확장자 .do는 생략 가능.
	//input type="file"로 넘어온 요청파라미터는 MultipartFile 타입의 변수로 받으면 된다.
	public String singleUpload(@RequestParam MultipartFile upImage,
			HttpServletRequest request, ModelMap map, HttpSession session)
					throws IOException {

		//null : upImage name의 요청파라미터가 없는 경우 
		//isEmpty()-true : 사용자가 파일을 전송 하지 않은 경우 
		if (upImage != null && !upImage.isEmpty()) { // 업로드된 파일이 있다.
			//업로드된 파일의 정보를 조회
			String fileName1 = upImage.getOriginalFilename();
			long fileSize = upImage.getSize();

			System.out.println(fileName1 + " - " + fileSize);
			//long timeMilis = System.currentTimeMillis();

			//파일을 임시저장경로에서 최종 저장경로로 이동.
			//%TOMCAT_HOME%\\webapps\\applicationRoot_dir\\upimage
			String dir = request.getServletContext().getRealPath("/upimage");
			//  /의 의미 -> application root. application_root/upimage의 실제 파일 경로를 String값을 return.
			System.out.println(dir);

			File upImg = new File(dir, fileName1);

			//File file = new File("c:\\java2\\down",fileName);

			//View(JSP)에 업로드된 이미지 파일명을 request 속성으로 전송 
			//map.addAttribute("image",fileName);

			session.setAttribute("image", fileName1);

			//File file = new File("c:\\java2\\WannaFitShare\\WannaFitShare\\WebContent\\upimage","ddd");
			//System.out.println(upImg.exists());    
			//System.out.println(upImg.canWrite());
			//upImage.transferTo(file); //copy(x) , move(o)9999+
			//FileCopyUtils.copy(upImage.getInputStream(),new FileOutputStream(file));
			upImage.transferTo(upImg);
		}
		return "customer/customer_main2.tiles"; //이동       
	}
}