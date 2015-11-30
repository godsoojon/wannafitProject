package com.wannafitshare.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.CalorieCalendarDao;
import com.wannafitshare.vo.CalorieCalendar;

@Service
public class CalorieCalendarServiceImpl implements CalorieCalendarService {

	private CalorieCalendarDao dao;

	public CalorieCalendarServiceImpl() {
		super();
	}

	@Autowired
	public CalorieCalendarServiceImpl(CalorieCalendarDao dao) {
		super();
		this.dao = dao;
	}
	@Override
	public void saveCalorie(CalorieCalendar temp) {
		
		dao.saveCalorie(temp);
	}
	@Override
	public CalorieCalendar selectCal(CalorieCalendar temp) {
		// TODO Auto-generated method stub
		CalorieCalendar result = dao.selectCal(temp);
		if(result==null){
			result = new CalorieCalendar(temp.getCsId(), temp.getCalorieDate(), 0);
		}
		return result;
	}
}
