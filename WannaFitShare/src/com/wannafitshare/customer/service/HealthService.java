package com.wannafitshare.customer.service;

import com.wannafitshare.vo.Health;

public interface HealthService {

	void addHealth(Health health);
	
	Health findHealthById(String csId);
	
	int updateHealth(Health health);
}
