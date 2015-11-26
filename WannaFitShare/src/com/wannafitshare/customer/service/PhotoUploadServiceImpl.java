package com.wannafitshare.customer.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.PhotoUploadDao;
import com.wannafitshare.vo.PhotoUpload;

@Service
public class PhotoUploadServiceImpl implements PhotoUploadService{
	
	private PhotoUploadDao dao;

	@Autowired
	public PhotoUploadServiceImpl(PhotoUploadDao dao) {
		this.dao = dao;
	}

	public PhotoUploadServiceImpl() {
	}

	@Override
	public void addPhotoUpload(PhotoUpload photoUpload) throws SQLException {
		dao.insertPhotoUpload(photoUpload);		
	}
}
