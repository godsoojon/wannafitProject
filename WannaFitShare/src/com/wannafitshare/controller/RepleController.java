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
 * photo_id 로 reple list 가져오기
 */
    @RequestMapping("/findReple")
    public String findReple(ModelMap model,HttpSession session){
    	PhotoUpload photo = (PhotoUpload)session.getAttribute("photo");
    	List<Reple> list=null;
    	list =rService.findReple(photo.getPhotoId());
    	//PhotoUpload photoUpload=pService.findPhotoUploadById(photoId);
    	
    	//session.setAttribute("photo", photoUpload);
    	
    	model.addAttribute("repleList",list);
    	
    	return "picture/sample.tiles";
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
    	Reple reple=rService.findRepleOne(repleId);
    	String id2 =reple.getCsId();    	
    	
    	if(id1.equals(id2)){
    		url="picture/reple_register.tiles";
    		model.addAttribute("repleId",repleId);
    		
    	}else{
    		//JOptionPane.showMessageDialog(null, "고객님이 쓴 글이 아닙니다.");
    		url="/reple/return.do";
    	}
    	return url;
    }
    @RequestMapping("/updateSuccess")
    public String updateSuccess(@RequestParam int repleId,@RequestParam String repletxt,HttpSession session){
    	
    	Customer customer =(Customer)session.getAttribute("loginInfo");
    	PhotoUpload photo =(PhotoUpload)session.getAttribute("photo");
    	Reple reple=new Reple(repleId,customer.getCsId(),photo.getPhotoId(),repletxt,new Date(),customer.getCsName(),customer.getCsPicture());
    	
    	rService.updateReple(reple);
    	//JOptionPane.showMessageDialog(null, "수정되었습니다.");
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
    	repleContent.trim();
    	
    	if(repletxt.length()==0){
    		JOptionPane.showMessageDialog(null, "댓글 내용이 없습니다.");
    		return "/reple/return.do";
    	}else{
    	Reple reple= new Reple(csId,photo.getPhotoId(),repleContent,new Date(),customer.getCsName(),customer.getCsPicture());
    	System.out.println(reple);
    	rService.addReple(reple);
  
    	return "/reple/return.do";
    	}
    	
    }
    
    @RequestMapping("/return")
    public String returnPhoto(HttpSession session,ModelMap model){
    	
    PhotoUpload photo=(PhotoUpload)session.getAttribute("photo");	
 	List<Reple> list=null;
	list =rService.findReple(photo.getPhotoId());
    
	model.addAttribute("repleList",list);
	return "picture/sample.tiles";
    }
    
    
    @RequestMapping("/deleteReple")
    public String deleteReple(@RequestParam int repleId,HttpSession session){
    	Customer customer =(Customer)session.getAttribute("loginInfo");
    	String id1=customer.getCsId();    	
    	Reple reple=rService.findRepleOne(repleId);
    	String id2 =reple.getCsId();
    	if(id1.equals(id2)){
    		//JOptionPane.showMessageDialog(null, "삭제되었습니다.");
    		rService.deleteReple(repleId);
    	}    	
    	return "/reple/return.do";    	
    }
}
