package com.wannafitshare.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.HealthDao;
import com.wannafitshare.vo.Health;

@Service("healthService")
public class HealthServiceImpl implements HealthService{

	private HealthDao dao;

	public HealthServiceImpl() {
	}

	@Autowired
	public HealthServiceImpl(HealthDao dao) {
		this.dao = dao;
	}
	
	public void addHealth(Health health){
		dao.insertHealth(health);
		
	}
	
	public Health findHealthById(String csId){
		return dao.selectHealthById(csId);
		
	}
	
	public int updateHealth(Health health){
		return dao.updateHealth(health);
		
	}
}
