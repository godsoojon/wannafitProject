package com.wannafitshare.customer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

@Repository
public class PhotoDaoImpl implements PhotoDao{
	
	private SqlSessionTemplate session; 
	
	@Autowired
	public PhotoDaoImpl(SqlSessionTemplate session) {
		this.session = session;
	}

	public PhotoDaoImpl() {
	}


}
