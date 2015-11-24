package com.wannafitshare.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.RepleService;

@Controller
@RequestMapping("/reple")
public class RepleController {

    @Autowired 
    private RepleService rService;

    

    @RequestMapping("/list")
    public String listCmt(@RequestParam String photoId, ModelMap map) {
    	//사진아이디를 가져와서 그아이디를 가진 댓글을 리스트로 블러옴

          List listCmt = rService.getListCmt(no);

          map.put("listCmt", listCmt);

          return "reboard/listCmt";

    }

    

    @RequestMapping("/addReple")

    public void createCmt(ModelMap model,@ModelAttribute,) throws IOException {

          dao.createCmt(dto);

          writer.write("end");

    }

    @RequestMapping(value="/re/deleteCmt", method={RequestMethod.GET, RequestMethod.POST})

    public void deleteCmt(ReboardDto dto, Writer writer) throws IOException {

          dao.deleteCmt(dto);

          writer.write("end");

    }


}
