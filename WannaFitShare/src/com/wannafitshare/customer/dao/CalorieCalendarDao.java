package com.wannafitshare.customer.dao;

import java.util.List;

import com.wannafitshare.vo.CalorieCalendar;

public interface CalorieCalendarDao {

	void saveCalorie(CalorieCalendar temp);
	public CalorieCalendar selectCal(CalorieCalendar temp);
}
