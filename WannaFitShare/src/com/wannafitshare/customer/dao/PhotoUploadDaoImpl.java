package com.wannafitshare.customer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannafitshare.vo.PhotoUpload;

@Repository
public class PhotoUploadDaoImpl implements PhotoUploadDao {
	
	private SqlSessionTemplate session; //no-arg생성자로 객체생성후 instance변수 

	public PhotoUploadDaoImpl() {
	}
	
	@Autowired
	public PhotoUploadDaoImpl(SqlSessionTemplate session) {
		this.session = session;
	}

	@Override
	public int insertPhotoUpload(PhotoUpload photoUpload) {
		return session.insert("photoUploadMapper.insertPhotoUpload", photoUpload);
	}
	
	
	
	
	

}
