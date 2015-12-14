package com.wannafitshare.customer.dao;

import java.util.List;

import com.wannafitshare.vo.FriendList;

public interface FriendListDao {

	int insertFriendList(FriendList friendList);

	List<FriendList> selectfriendList(String csId);
	
	FriendList selectFriend(FriendList friendList);
	int deleteFriendList(FriendList friendList);
	
	int updateFriendListByfriendId(FriendList friendList);
}
