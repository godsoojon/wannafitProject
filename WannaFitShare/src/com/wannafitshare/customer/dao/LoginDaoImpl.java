package com.wannafitshare.customer.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wannafitshare.vo.Customer;

@Repository
public class LoginDaoImpl implements LoginDao {

	private SqlSessionTemplate session;

	public LoginDaoImpl() {
		super();
	}

	@Autowired
	public LoginDaoImpl(SqlSessionTemplate session) {
		super();
		this.session = session;
	}

	@Override
	public Customer loginCustomer(String csId, String csPassword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("csId", csId);
		map.put("csPassword", csPassword);
		return session.selectOne("loginMapper.loginCustomer", map);
	}
	
	@Override
	public Customer loginCustomer2(Customer customer) {
		return session.selectOne("loginMapper.loginCustomer2", customer);
	}

}
