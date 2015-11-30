package com.wannafitshare.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.HealthDao;
import com.wannafitshare.customer.dao.RepleDao;
import com.wannafitshare.vo.Reple;

@Service("repleService")
public class RepleServiceImple implements RepleService{

	private RepleDao dao;

	public RepleServiceImple() {
	}

	@Autowired
	public RepleServiceImple(RepleDao dao) {
		this.dao = dao;
	}
	
	public List<Reple> findReple(String photoId){
		return dao.findReple(photoId);
	}
	
	
	
}
