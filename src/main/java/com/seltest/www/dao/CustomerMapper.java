package com.seltest.www.dao;

import com.seltest.www.vo.Customer;

public interface CustomerMapper {

	public int insertCustomer(Customer customer);
	
	public int verifyUser(String cust_Email);

	public Customer searchCustomerOne(String cust_Id);
}
