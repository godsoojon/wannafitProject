package com.wannafitshare.customer.dao;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public List<String> selectAllParty() {
		return session.selectList("partyMapper.selectAllParty");
	}

	@Override
	public Party selectPartyByName(String partyName) {
		return session.selectOne("partyMapper.selectPartyByName", partyName);
	}

	@Override
	public List<Party> selectPartyBycsId(String csId) {
		return session.selectList("partyMapper.selectPartyBycsId", csId);
	}

	@Override
	public List<String> belongParty(String csId) {
		return session.selectList("partyMapper.belongParty", csId);
	}

	@Override
	public List<String> friendList(String csId) {
		return session.selectList("partyMapper.friendList", csId);
	}

	public int deleteParty(String partyName) {
		return session.delete("partyMapper.deleteParty", partyName);
	}

	@Override
	public int updatePartyRight(String partyName, int partyRight) {
		HashMap map = new HashMap();
		map.put("partyName", partyName);
		map.put("partyRight", partyRight);
		return session.update("partyMapper.updateParty", map);
	}

}
