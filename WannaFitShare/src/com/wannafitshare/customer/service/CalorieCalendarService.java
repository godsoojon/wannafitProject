package com.wannafitshare.customer.service;

import com.wannafitshare.vo.CalorieCalendar;

public interface CalorieCalendarService {
	public void saveCalorie(CalorieCalendar temp);
	public CalorieCalendar selectCal(CalorieCalendar temp);
}
