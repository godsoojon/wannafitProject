package com.wannafitshare.customer.dao;

import java.util.List;

public interface PartyListDao {

	int insertPartyList(String csId, String partyName);

	List<String> belongParty(String csId);
}
