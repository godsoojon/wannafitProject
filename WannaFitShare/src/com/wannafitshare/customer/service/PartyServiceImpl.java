package com.wannafitshare.customer.service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.PartyDao;
import com.wannafitshare.vo.Party;

@Service
public class PartyServiceImpl implements PartyService {

	private PartyDao dao;

	public PartyServiceImpl() {
		super();
	}

	@Autowired
	public PartyServiceImpl(PartyDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public void insertParty(Party party) {
		dao.insertParty(party);
	}

	@Override
	public List<Party> selectAllParty() {
		return dao.selectAllParty();
	}

	@Override
	public Party selectPartyByName(String partyName) {
		return dao.selectPartyByName(partyName);
	}

	@Override
	public List<Party> selectPartyBycsId(String csId) {
		return dao.selectPartyBycsId(csId);
	}

	@Override
	public List<String> belongParty(String csId) {
		return dao.belongParty(csId);
	}

	@Override
	public List<String> friendList(String csId) {
		return dao.friendList(csId);
	}

	public int deleteParty(String partyName) {
		return dao.deleteParty(partyName);
	}

	@Override
	public int updatePartyRight(String partyName, int partyRight) {
		return dao.updatePartyRight(partyName, partyRight);
	}

}
