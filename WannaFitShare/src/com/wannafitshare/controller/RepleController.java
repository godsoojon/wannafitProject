package com.wannafitshare.controller;
import javax.swing.JOptionPane;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;

import com.wannafitshare.customer.service.PhotoUploadService;
import com.wannafitshare.customer.service.RepleService;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.PhotoUpload;
import com.wannafitshare.vo.Reple;

@Controller
@RequestMapping("/reple")
public class RepleController {

    @Autowired 
    private RepleService rService;
    
    @Autowired 
    private  PhotoUploadService pService;

    
/*
 * 포토 아이디로 리플 리스트 가져오기
 */

    @RequestMapping("/findReple")
    public String findReple(@RequestParam int photoId,ModelMap model,HttpSession session){
    	List<Reple> list=null;
    	
    	list =rService.findReple(photoId);
    	PhotoUpload photoUpload=pService.findPhotoUploadById(photoId);
    	
    	session.setAttribute("photo", photoUpload);
    	
    	model.addAttribute("repleList",list);
    	return "picture/photo_see.tiles";
    }
    
    /*
     * 리플 수정
     */
    
    @RequestMapping("/updateReple")
    public String updateReple(@RequestParam int repleId,HttpSession session,
    		ModelMap model){
    	String url="";
    	Customer customer =(Customer)session.getAttribute("loginInfo");
    	String id1=customer.getCsId();
    	
    	
    	
    	
    	if(id1.equals(repleId)){
    		url="picture/reple_register.tiles";
    		model.addAttribute("repleId",repleId);
    		
    	}else{
    		JOptionPane.showMessageDialog(null, "고객님이 쓴 글이 아닙니다.");
    		url="/reple/return.do";
    	}
    	return url;
    }
    @RequestMapping("/updateSuccess")
    public String updateSuccess(@RequestParam int repleId,@RequestParam String repletxt,HttpSession session){
    	
    	Customer customer =(Customer)session.getAttribute("loginInfo");
    	PhotoUpload photo =(PhotoUpload)session.getAttribute("photo");
    	Reple reple=new Reple(repleId,customer.getCsId(),photo.getPhotoId(),repletxt,new Date());
    	
    	rService.updateReple(reple);
    	JOptionPane.showMessageDialog(null, "수정되었습니다.");
    	return "/reple/return.do";
    	
    }
    
    
   /*
    * 리플 add
    */
    @RequestMapping("/addReple")
    public String addReple(HttpSession session, ModelMap model,@RequestParam String repletxt){
    	
    	Customer customer =(Customer)session.getAttribute("loginInfo");
    	String csId=customer.getCsId();
    	PhotoUpload photo=(PhotoUpload)session.getAttribute("photo");
    	
    	String repleContent=repletxt;
    	int photoId=photo.getPhotoId();
    	System.out.println(photoId);
    	
    	Reple reple= new Reple(csId,photoId,repleContent,new Date());
    	rService.addReple(reple);
    	model.addAttribute("reple",reple);
    	return "/reple/return.do";
    	
    	
    }
    
    @RequestMapping("/return")
    public String returnPhoto(HttpSession session,ModelMap model){
    PhotoUpload photo=(PhotoUpload)session.getAttribute("photo");
    int photoId=photo.getPhotoId();
 	List<Reple> list=null;
	list =rService.findReple(photoId);
    
	model.addAttribute("repleList",list);
	return "picture/photo_see.tiles";
    
    }
    
    
    @RequestMapping("/deleteReple")
    public String deleteReple(@RequestParam int repleId,HttpSession session){
    	Customer customer =(Customer)session.getAttribute("loginInfo");
    	String id1=customer.getCsId();
    	
    	Reple reple=rService.findRepleOne(repleId);
    	String id2 =reple.getCsId();
    	if(id1.equals(id2)){
    		JOptionPane.showMessageDialog(null, "삭제되었습니다.");
    		rService.deleteReple(repleId);
    	}
    	
    	return "/reple/return.do";
    	
    }
    

}
