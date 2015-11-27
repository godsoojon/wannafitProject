package com.wannafitshare.customer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannafitshare.vo.Health;
@Repository
public class HealthDaoImpl implements HealthDao{
	
	
	private SqlSessionTemplate session; 
	
	@Autowired
	public HealthDaoImpl(SqlSessionTemplate session) {
		this.session = session;
	}

	public HealthDaoImpl() {
	}
	
	@Override
	public int insertHealth(Health health){
		return session.insert("healthMapper.insertHealth",health);
		
	}

	public Health selectHealthById(String csId){
		return session.selectOne("healthMapper.selectHealthById",csId);
	}
	
	public int updateHealth(Health health){
		return session.update("healthMapper.updateHealth",health);
		
	}

}
