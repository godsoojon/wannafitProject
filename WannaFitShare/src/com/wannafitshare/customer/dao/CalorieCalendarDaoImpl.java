package com.wannafitshare.customer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannafitshare.vo.CalorieCalendar;

@Repository
public class CalorieCalendarDaoImpl implements CalorieCalendarDao{
	
	private SqlSessionTemplate session;

	public CalorieCalendarDaoImpl() {
		super();
	}

	@Autowired
	public CalorieCalendarDaoImpl(SqlSessionTemplate session) {
		super();
		this.session = session;
	}
	@Override
	public void saveCalorie(CalorieCalendar temp) {
		System.out.println("ddddd");
		session.selectOne("caloriecalendarMapper.insert-sql", temp);
	}
	@Override
	public CalorieCalendar selectCal(CalorieCalendar temp) {
		return session.selectOne("caloriecalendarMapper.select-cal",temp);
	}

}
