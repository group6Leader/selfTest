package com.seltest.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.seltest.www.customer.vo.Customer;

@Repository
public class CustomerDAO {

	
	@Autowired
	SqlSession sqlSession;
	

	public int insertCustomer(Customer customer){
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		
		int result = 0;
		
		try{
			result = mapper.insertCustomer(customer);
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return result;
		
		
		
	}
}
