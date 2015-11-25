package com.wannafitshare.customer.service;

import java.util.List;

import com.wannafitshare.vo.Party;

public interface PartyService {

	void insertParty(Party party);

	List<String> selectAllParty();

	public Party selectPartyByName(String partyName);
	
	/*public List<String> selectBelongParty();*/
}
