package com.wannafitshare.customer.service;

import java.sql.SQLException;

import com.wannafitshare.vo.PhotoUpload;

public interface PhotoUploadService {

	void addPhotoUpload (PhotoUpload photoUpload)  throws SQLException;	
}

