package com.wannafitshare.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wannafitshare.customer.service.CalorieCalendarService;
import com.wannafitshare.vo.CalorieCalendar;

@Controller
@RequestMapping("/CalorieCalendarController")
public class CalorieCalendarController {
	
	@Autowired
	private CalorieCalendarService service;
	
	@RequestMapping("/save")
	public String saveCalorieCalendar(@RequestParam String csId,
			@RequestParam String year, @RequestParam String month, @RequestParam String day, @RequestParam int totalCalorie, HttpSession session) {
		CalorieCalendar temp = new CalorieCalendar(csId, new Date(Integer.parseInt(year)-1900,Integer.parseInt(month)-1,Integer.parseInt(day)), totalCalorie);
		System.out.println("cont");
		service.saveCalorie(temp);
		return "";
	}
	@RequestMapping("/printcal")
	public String printTotalCalorie(@RequestParam String csId,
			@RequestParam String year, @RequestParam String month, @RequestParam String day, HttpSession session) {
		CalorieCalendar temp = new CalorieCalendar(csId, new Date(Integer.parseInt(year)-1900,Integer.parseInt(month)-1,Integer.parseInt(day)), 0);
		System.out.println("print");
		CalorieCalendar result = service.selectCal(temp);
		return "/calendarPop.jsp?year="+year+"&month="+month+"&day="+day+"&csId="+csId+"&printcal="+result.getTotalCalorie();
	}
}
