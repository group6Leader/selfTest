package com.seltest.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.seltest.www.customer.vo.Customer;

@Repository
public class CustomerDAO {

	private static final Logger logger = LoggerFactory.getLogger(CustomerDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	

	public boolean insertCustomer(Customer customer){
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		
		boolean result = false;
		int joinCnt = 0;
		
		try{
			joinCnt = mapper.insertCustomer(customer);
			logger.info("Join User Count : " + joinCnt);
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
	
		if(joinCnt == 1) {
			
			logger.info("Join User Success");
			
			result = true;
		}
		else {
			
			logger.info("Join User Fail");
			
			result = false;
		}
		
		
		return result;
	}
	
	
	/*
	 *  @comment		: E-mail 인증을 확인
	 *  @param	userid	: E-mail 인증을 받은 Mail Address
	 *  @return			: E-mail 인증 여부
	 *  @author			: 김준형
	 */
	public boolean verifyUser(String cust_Email) {
		
		logger.info("E-mail Verify Start");
		
		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
		
		boolean result = false;
		int updateCnt = 0;
		
		try {
			
			updateCnt = mapper.verifyUser(cust_Email);
			logger.info("E-mail Verify Count : {}", updateCnt);
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		if(updateCnt == 1) {
			
			logger.info("E-mail Verify Success");
			
			result = true;
		}
		else {
			
			logger.info("E-mail Verify Fail");
			
			result = false;
		}
		
		return result;
		
	}
}
