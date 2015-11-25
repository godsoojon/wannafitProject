package com.wannafitshare.customer.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannafitshare.vo.Party;

@Repository
public class PartyDaoImpl implements PartyDao {
	@Autowired
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
	public int insertParty(Party party) {
		return session.insert("partyMapper.insertParty", party);
	}

	@Override
	public List<String> selectAllParty() {
		return session.selectList("partyMapper.selectAllParty");
	}

	@Override
	public Party selectPartyByName(String partyName) {
		System.out.println(partyName+"-----dao");
		return session.selectOne("partyMapper.selectPartyByName", partyName);
	}
	
/*	public List<String> selectBelongParty(){
		
	}
*/
}
