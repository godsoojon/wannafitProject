package com.wannafitshare.customer.service;

import java.util.List;

public interface PartyListService {

	void insertPartyList(String csId, String partyName);

	List<String> belongParty(String csId);

}
