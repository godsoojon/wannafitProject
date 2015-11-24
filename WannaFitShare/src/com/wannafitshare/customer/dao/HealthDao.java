package com.wannafitshare.customer.dao;

import com.wannafitshare.vo.Health;

public interface HealthDao {
	
	int insertHealth(Health health);
	
	Health selectHealthById(String csId);
	int updateHealth(Health health);
}
