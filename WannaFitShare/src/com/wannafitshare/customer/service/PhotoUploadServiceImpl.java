package com.wannafitshare.customer.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.PhotoUploadDao;
import com.wannafitshare.customer.exception.CustomerNotFoundException;
import com.wannafitshare.customer.exception.DuplicatedIdException;
import com.wannafitshare.vo.Customer;
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
	public int photoNum(){
		int num=0;
		PhotoUpload pload = dao.selectPhotoUploadById(num);
		while(pload!=null){
			num++;
			pload = dao.selectPhotoUploadById(num); //1증가한 num 대입 
		}
		return num;
	}
	@Override
	public void addPhotoUpload(PhotoUpload photoUpload) throws SQLException {
		/*int num=0;
		System.out.println(photoUpload);
		//포토 id 조회
		PhotoUpload pload = dao.selectPhotoUploadById(photoUpload.getPhotoId());
		while (pload != null){ //null일때 빠져나옴
			num=pload.getPhotoId(); //num에 photoId 대입
			num++; //num 1 증가 	
			pload = dao.selectPhotoUploadById(num); //1증가한 num 대입 
		}
		photoUpload.setPhotoId(num);*/
		System.out.println(photoUpload);
		dao.insertPhotoUpload(photoUpload);		
	}

	@Override
	public PhotoUpload findPhotoUploadById (int photoId) {
	
		return dao.selectPhotoUploadById(photoId);
	}
	
	@Override
	public List <PhotoUpload> listPhotoUpload(String csId) {
		return dao.listPhotoUpload(csId);
	}
	
	@Override
	public void deletePhotoUploadByPhotoId(int deletePhotoId)  {
		
		dao.deletePhotoUploadByPhotoId(deletePhotoId);
	}

	@Override
	public List<PhotoUpload> listPhotoUploadBypartyName(String partyName) {
		return dao.listPhotoUploadBypartyName(partyName);
	}
	
	
}
