package com.wannafitshare.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.CustomerDao;
import com.wannafitshare.customer.dao.FriendListDao;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.FriendList;


@Service("friendListService")
public class FriendListServiceImpl implements FriendListService{
	
	private FriendListDao dao;

	public FriendListServiceImpl() {
	}

	@Autowired
	public FriendListServiceImpl(FriendListDao dao) {
		this.dao = dao;
	}

	@Override
	public void addFriendList(FriendList friendList) {
		//여기서 이미 등록된 친구이면 exception처리

		dao.insertFriendList(friendList);
	}


	@Override
	public List<String> findFriendListById(String csId) {
		return dao.selectfriendList(csId);

	}
	
	public FriendList findFriend(FriendList friendList){
		return dao.selectFriend(friendList);
		
	}
	public int deleteFriendList(FriendList friendList){
		return dao.deleteFriendList(friendList);
	}
}
