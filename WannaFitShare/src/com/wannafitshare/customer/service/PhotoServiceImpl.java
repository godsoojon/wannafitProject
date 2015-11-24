package com.wannafitshare.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.HealthDao;
import com.wannafitshare.customer.dao.PhotoDao;

@Service("photoService")

public class PhotoServiceImpl implements PhotoService{

	private PhotoDao dao;

	public PhotoServiceImpl() {
	}

	@Autowired
	public PhotoServiceImpl(PhotoDao dao) {
		this.dao = dao;
	}

}
