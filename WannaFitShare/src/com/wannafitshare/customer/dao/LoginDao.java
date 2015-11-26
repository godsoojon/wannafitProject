package com.wannafitshare.customer.dao;

import com.wannafitshare.vo.Customer;

public interface LoginDao {

	Customer loginCustomer(String csId, String csPassword);

	Customer loginCustomer2(Customer customer);
}
