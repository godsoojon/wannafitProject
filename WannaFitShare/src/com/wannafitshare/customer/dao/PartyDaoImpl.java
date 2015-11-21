package com.wannafitshare.customer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannafitshare.vo.Party;

@Repository
public class PartyDaoImpl implements PartyDao {

	private SqlSessionTemplate session;

	public PartyDaoImpl() {
		super();
	}

	@Autowired
	public PartyDaoImpl(SqlSessionTemplate session) {
		super();
		this.session = session;
	}

	@Override
	public void insertParty(Party party) {
		session.insert("partyMapper.insertParty", party);
	}

}
