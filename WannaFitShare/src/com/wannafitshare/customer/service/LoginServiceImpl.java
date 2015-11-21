package com.wannafitshare.customer.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wannafitshare.customer.dao.LoginDao;
import com.wannafitshare.vo.Customer;

@Service
public class LoginServiceImpl implements LoginService {

	private LoginDao dao;

	public LoginServiceImpl() {
		super();
	}

	@Autowired
	public LoginServiceImpl(LoginDao dao) {
		super();
		this.dao = dao;
	}

	@Override
	public Customer loginCustomer(String csId, String csPassword) {
		return dao.loginCustomer(csId, csPassword);
	}

}
