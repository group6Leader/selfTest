package com.seltest.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seltest.www.vo.Customer;
import com.seltest.www.vo.SelfCheck;

@Repository
public class SelfCheckDAO {

	@Autowired
	SqlSession sqlSession;

	public int insertSelfCheck(SelfCheck selfCheck) {

		int result = 0;

		try {
			SelfCheckMapper mapper = sqlSession.getMapper(SelfCheckMapper.class);
			result = mapper.insertSelfCheck(selfCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int update(SelfCheck selfCheck) {
		
		int result = 0;
		
		try {
			SelfCheckMapper mapper = sqlSession.getMapper(SelfCheckMapper.class);
			result = mapper.update(selfCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int update2(SelfCheck selfCheck) {
		
		int result = 0;
		
//		System.out.println("DAO2");
		
		try {
			SelfCheckMapper mapper = sqlSession.getMapper(SelfCheckMapper.class);
			result = mapper.update2(selfCheck);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	public SelfCheck searchSelfCheckOne(int cust_Num) {
		
		SelfCheck selfCheck = null;
		
		try {
			SelfCheckMapper mapper = sqlSession.getMapper(SelfCheckMapper.class);
			selfCheck = mapper.searchSelfCheckOne(cust_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return selfCheck;
	}
	
	public ArrayList<SelfCheck> sList() {
		
		ArrayList<SelfCheck> sList = null;
		
		try {
			SelfCheckMapper mapper = sqlSession.getMapper(SelfCheckMapper.class);
			sList = mapper.sList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sList;
	}

}
