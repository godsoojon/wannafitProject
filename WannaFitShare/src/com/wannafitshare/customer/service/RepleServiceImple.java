package com.wannafitshare.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.HealthDao;
import com.wannafitshare.customer.dao.RepleDao;

@Service("repleService")
public class RepleServiceImple implements RepleService{

	private RepleDao dao;

	public RepleServiceImple() {
	}

	@Autowired
	public RepleServiceImple(RepleDao dao) {
		this.dao = dao;
	}
	
}
