package com.wannafitshare.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.RepleService;
import com.wannafitshare.vo.Reple;

@Controller
@RequestMapping("/reple")
public class RepleController {

    @Autowired 
    private RepleService rService;

    
/*
 * 포토 아이디로 리플 리스트 가져오기
 */

    @RequestMapping("/findRelple")
    public String findReple(@RequestParam String photoId,ModelMap model){
    	List<Reple> list=null;
    	list =rService.findReple(photoId);
    	
    	model.addAttribute("repleList",list);
    	return "picture/photo_see.tiles";
    }
    
    /*
     * 
     */

}
