package com.wannafitshare.customer.dao;

import java.util.List;

import com.wannafitshare.vo.Reple;



public interface RepleDao {

	List<Reple> findReple(String photoId);
	
	
}
