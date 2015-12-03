package com.wannafitshare.customer.dao;

import java.util.List;

import com.wannafitshare.vo.Reple;



public interface RepleDao {

	List<Reple> findReple(int photoId);
	
	void updateReple(Reple reple);
	
	void insertReple(Reple reple);
	
	Reple findRepleByRepleId(int repleId);
	
	void deleteReple(int repleId);
}
