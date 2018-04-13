package com.seltest.www.dao;

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
		/*System.out.println(selfCheck);*/

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

}
