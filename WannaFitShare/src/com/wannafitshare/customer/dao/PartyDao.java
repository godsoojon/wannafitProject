package com.wannafitshare.customer.dao;

import java.util.List;

import com.wannafitshare.vo.Party;

public interface PartyDao {

	void insertParty(Party party);

	List<String> selectAllParty();

	Party selectPartyByName(String partyName);

	List<String> belongParty(String csId);

	List<String> friendList(String csId);
	 int deleteParty(String partyName);
}
