package com.wannafitshare.customer.dao;

import java.util.List;

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
		System.out.println(photoUpload);
		return session.insert("photoUploadMapper.insertPhotoUpload", photoUpload);
	}

	@Override
	public PhotoUpload selectPhotoUploadById(int photoId) {
		return session.selectOne("photoUploadMapper.selectPhotoUploadById",photoId);
	}
	
	
	@Override
	public List <PhotoUpload>  listPhotoUpload (String csId) {
		return session.selectList("photoUploadMapper.listPhotoUpload", csId);
	}
	
	
	
	@Override
	public List<PhotoUpload> listPhotoUploadBypartyName(String partyName) {
		return session.selectList("photoUploadMapper.listPhotoUploadBypartyName", partyName);
	}

	@Override
	public int deletePhotoUploadByPhotoId(int deletePhotoId) {
		return session.delete("photoUploadMapper.deletePhotoUploadByPhotoId", deletePhotoId);
	}

	
	
	

}
