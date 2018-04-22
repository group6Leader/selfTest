package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.Customer;

public interface CustomerMapper {

	public int insertCustomer(Customer customer);
	
	public int verifyUser(String cust_Email);

	public Customer searchCustomerOne(String cust_Id);
	
	public ArrayList<Customer> cList();
	
	public Customer readOne(int cust_Num);
	
	public int fixCustomer(Customer customer);
	
	public int delCustomer(String cust_Id);
	
	
}
