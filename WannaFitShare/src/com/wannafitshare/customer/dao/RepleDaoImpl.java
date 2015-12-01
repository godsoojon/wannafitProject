package com.wannafitshare.customer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannafitshare.vo.Reple;

@Repository
public class RepleDaoImpl implements RepleDao{

	private SqlSessionTemplate session; 
	
	@Autowired
	public RepleDaoImpl(SqlSessionTemplate session) {
		this.session = session;
	}

	public RepleDaoImpl() {
	}
    

  public List<Reple> findReple(int photoId){
	  return session.selectList("repleMapper.selectReple",photoId);
	  
  }
  
  public void updateReple(Reple reple){
	  	session.update("repleMapper.updateReple",reple);
  }
  public void insertReple(Reple reple){
	  session.insert("repleMapper.insertReple",reple);
  }

  public Reple findRepleByRepleId(int repleId){
	  return session.selectOne("repleMapper.selectRepleOne",repleId);
	  
  }
  public void deleteReple(int repleId){
	  session.delete("repleMapper.deleteReple",repleId);
  }
	

}
