package com.wannafitshare.customer.service;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.PartyDao;
import com.wannafitshare.vo.Party;

@Service("partyService")
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
	public List<String> selectAllParty() {
		return dao.selectAllParty();
	}
	
/*	public List<String> selectBelongParty(){
		return dao.selectBelongParty();
	}
*/
	@Override
	public Party selectPartyByName(String partyName) {
		System.out.println("service : pn - "+partyName);
		Party p = dao.selectPartyByName(partyName);
		System.out.println(p);
		return p;
	}

}
