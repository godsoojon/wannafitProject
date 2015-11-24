package com.wannafitshare.customer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannafitshare.vo.FriendList;

@Repository
public class FriendListDaoImpl implements FriendListDao{

	private SqlSessionTemplate session; 
	
	@Autowired
	public FriendListDaoImpl(SqlSessionTemplate session) {
		this.session = session;
	}

	public FriendListDaoImpl() {
	}

	
	@Override
	public int insertFriendList(FriendList friendList) {
		return session.insert("friendListMapper.insertFriendList", friendList);
	}

	@Override
	public List<String> selectfriendList(String csId) {
		return session.selectList("friendListMapper.selectFriendList", csId);
	}


}
