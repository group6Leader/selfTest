package com.seltest.www.dao;

import com.seltest.www.customer.vo.Customer;

public interface CustomerMapper {

	public int insertCustomer(Customer customer);
	
	public int verifyUser(String cust_Email);

}
