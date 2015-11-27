package com.wannafitshare.customer.dao;

import java.util.List;

import com.wannafitshare.vo.Party;

public interface PartyListDao {

	int insertPartyList(String csId, String partyName);

	List<String> belongParty(String csId);
	
}
