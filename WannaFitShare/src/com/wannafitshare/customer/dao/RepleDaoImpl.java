package com.wannafitshare.customer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RepleDaoImpl implements RepleDao{
private SqlSessionTemplate session; 
	
	@Autowired
	public RepleDaoImpl(SqlSessionTemplate session) {
		this.session = session;
	}

	public RepleDaoImpl() {
	}
    

  

	

}
