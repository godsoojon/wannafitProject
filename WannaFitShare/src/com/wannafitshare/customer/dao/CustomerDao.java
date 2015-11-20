package com.wannafitshare.customer.dao;

import java.util.List;

import com.wannafitshare.vo.Customer;
import com.wannafitshare.vo.FriendList;

public interface CustomerDao {

	Customer loginCustomer(String csId, String csPassword);

	int insertCustomer(Customer customer);

	int deleteCustomerById(String csId);

	int updateCustomer(Customer customer);

	Customer selectCustomerById(String customerId);

	List<Customer> selectCustomers();

	List<Customer> selectCustomersPaging(int pageNo);

	List<Customer> selectCustomersByName(String customerName);

	int selectCountCustomers();

	int insertFriendList(FriendList friendList);

	List<String> selectfriendList(String csId);

}
