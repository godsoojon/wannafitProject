package com.wannafitshare.customer.service;

import java.sql.SQLException;
import java.util.List;

import com.wannafitshare.customer.exception.DuplicatedIdException;
import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.FriendList;

public interface FriendListService {
	
	void addFriendList(FriendList friendList)
			throws DuplicatedIdException, SQLException;

	List <FriendList> findFriendListById(String csId);
	int updateFriendListByfriendId(FriendList friendList);
	
	FriendList findFriend(FriendList friendList);
	int deleteFriendList(FriendList friendList);
}
