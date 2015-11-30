package com.wannafitshare.customer.service;

import java.sql.SQLException;
import java.util.List;

import com.wannafitshare.vo.PhotoUpload;

public interface PhotoUploadService {

	void addPhotoUpload (PhotoUpload photoUpload)  throws SQLException;	
	
	PhotoUpload findPhotoUploadById(int photoId);
	
	List <PhotoUpload> listPhotoUpload(String csId);
	
	List <PhotoUpload> listPhotoUploadBypartyName (String partyName);
	
	void deletePhotoUploadByPhotoId(int deletePhotoId); 
	
	 int photoNum();
}

