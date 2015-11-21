package com.wannafitshare.customer.service;

import com.wannafitshare.vo.Customer;

public interface LoginService {

	Customer loginCustomer(String csId, String csPassword);
}
