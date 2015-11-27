package com.wannafitshare.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.PartyListDao;

@Service
public class PartyListServiceImpl implements PartyListService {

	private PartyListDao dao;

	public PartyListServiceImpl() {
		super();
	}

	@Autowired
	public PartyListServiceImpl(PartyListDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public void insertPartyList(String csId, String partyName) {
		dao.insertPartyList(csId, partyName);
	}

	@Override
	public List<String> belongParty(String csId) {
		return dao.belongParty(csId);
	}

}
