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
	public List<FriendList> selectfriendList(String csId) {
		return session.selectList("friendListMapper.selectFriendList", csId);
	}
	
	public FriendList selectFriend(FriendList friendList){
		return session.selectOne("friendListMapper.selectFriend",friendList);
	}

	public int deleteFriendList(FriendList friendList){
		return session.delete("friendListMapper.deleteFriend",friendList);
	}

	@Override
	public int updateFriendListByfriendId(FriendList friendList) {
		return session.update("friendListMapper.updateFriendListByfriendId",friendList);
		
	}
	
	
}
