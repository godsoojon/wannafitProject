package com.wannafitshare.customer.service;

import java.util.List;

import com.wannafitshare.vo.Reple;

public interface RepleService {
	List<Reple> findReple(int photoId);
	
	void updateReple(Reple reple);
	void addReple(Reple raple);
	Reple findRepleOne(int repleId);
	 void deleteReple(int repleId);
}
