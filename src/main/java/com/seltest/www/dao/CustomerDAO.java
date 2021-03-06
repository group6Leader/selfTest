package com.seltest.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seltest.www.vo.Customer;

@Repository
public class CustomerDAO {

	private static final Logger logger = LoggerFactory.getLogger(CustomerDAO.class);

	@Autowired
	SqlSession sqlSession;

	public boolean insertCustomer(Customer customer) {

		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);

		boolean result = false;
		int joinCnt = 0;

		try {
			joinCnt = mapper.insertCustomer(customer);
			logger.info("Join User Count : " + joinCnt);
			System.out.println(customer+"Dao");
			

		} catch (Exception e) {
			e.printStackTrace();

		}

		if (joinCnt == 1) {

			logger.info("Join User Success");

			result = true;
		} else {

			logger.info("Join User Fail");

			result = false;
		}

		return result;
	}

	/*
	 * @comment : E-mail 인증을 확인
	 * 
	 * @param userid : E-mail 인증을 받은 Mail Address
	 * 
	 * @return : E-mail 인증 여부
	 * 
	 * @author : 김준형
	 */
	public boolean verifyUser(String cust_Email) {

		logger.info("E-mail Verify Start");

		CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);

		boolean result = false;
		int updateCnt = 0;

		try {

			updateCnt = mapper.verifyUser(cust_Email);
			logger.info("E-mail Verify Count : {}", updateCnt);
		} catch (Exception e) {

			e.printStackTrace();
		}

		if (updateCnt == 1) {

			logger.info("E-mail Verify Success");

			result = true;
		} else {

			logger.info("E-mail Verify Fail");

			result = false;
		}

		return result;

	}

	public Customer searchCustomerOne(String cust_Id) {
		Customer result = null;

		logger.info("search id는"+cust_Id);
		
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			result = mapper.searchCustomerOne(cust_Id);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public ArrayList<Customer> cList() {
		ArrayList<Customer> cList = null;
		
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			cList = mapper.cList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cList;
	}
	
	public Customer readOne(int cust_Num) {
		Customer result = null;

//		logger.info("cust_Num " + cust_Num);
		
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			result = mapper.readOne(cust_Num);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int fixCustomer(Customer customer) {
		int result = 0;

		logger.info("search id는"+customer.getCust_Id());
		Customer fixCustomer = customer;
		
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			result = mapper.fixCustomer(fixCustomer);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	public int delCustomer(String cust_Id){
		int result = 0;
		
		logger.info("delete id는"+cust_Id);
		
		try {
			CustomerMapper mapper = sqlSession.getMapper(CustomerMapper.class);
			result = mapper.delCustomer(cust_Id);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
		
	}
	
	
	
	
}
