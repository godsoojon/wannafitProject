package com.wannafitshare.customer.service;

import java.lang.reflect.ParameterizedType;

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

}
