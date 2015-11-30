package com.wannafitshare.customer.dao;

import java.util.List;

import com.wannafitshare.vo.PhotoUpload;

public interface PhotoUploadDao {

	int insertPhotoUpload(PhotoUpload photoUpload);

	PhotoUpload selectPhotoUploadById(int photoId);

	List <PhotoUpload> listPhotoUpload (String csId);
	
	int deletePhotoUploadByPhotoId(int deletePhotoId);
	
	
	List <PhotoUpload> listPhotoUploadBypartyName (String partyName);
}
