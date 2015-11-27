package com.wannafitshare.customer.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PartyListDaoImpl implements PartyListDao {

	private SqlSessionTemplate session;

	public PartyListDaoImpl() {
		super();
	}

	@Autowired
	public PartyListDaoImpl(SqlSessionTemplate session) {
		super();
		this.session = session;
	}

	@Override
	public int insertPartyList(String csId, String partyName) {
		HashMap map = new HashMap();
		map.put("csId", csId);
		map.put("partyName", partyName);
		return session.insert("partyListMapper.insertPartyList", map);
	}

	@Override
	public List<String> belongParty(String csId) {
		return session.selectList("partyListMapper.belongParty", csId);
	}

}
