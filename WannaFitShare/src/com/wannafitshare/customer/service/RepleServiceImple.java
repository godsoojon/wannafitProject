package com.wannafitshare.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.HealthDao;
import com.wannafitshare.customer.dao.RepleDao;
import com.wannafitshare.vo.Reple;

@Service
public class RepleServiceImple implements RepleService{

	private RepleDao dao;

	public RepleServiceImple() {
	}

	@Autowired
	public RepleServiceImple(RepleDao dao) {
		this.dao = dao;
	}
	
	public List<Reple> findReple(int photoId){
		return dao.findReple(photoId);
	}
	public void updateReple(Reple reple){
		 dao.updateReple(reple);
	}
	public void addReple(Reple reple){
		dao.insertReple(reple);
	}
	public void deleteReple(int repleId){
		dao.deleteReple(repleId);
	}
	
	public Reple findRepleOne(int repleId){
		return dao.findRepleByRepleId(repleId);
	}
	
}
