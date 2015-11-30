package com.wannafitshare.customer.service;

import java.util.List;

import com.wannafitshare.vo.Reple;

public interface RepleService {
	List<Reple> findReple(String photoId);
}
