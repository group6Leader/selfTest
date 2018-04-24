package com.seltest.www.dao;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seltest.www.vo.HealthRecord;

@Repository
public class HealthRecordDAO {

	private static final Logger logger = LoggerFactory.getLogger(HealthRecordDAO.class);
	
	@Autowired
	SqlSession sqlSession;
	
	public boolean insertHealthRecord(HealthRecord healthRecord){
		
		HealthRecordMapper mapper = sqlSession.getMapper(HealthRecordMapper.class);
		
		
		boolean result = false;
		int insertHr = 0;
		
		try{
			insertHr = mapper.insertHealthRecord(healthRecord);
			
			logger.info("INSERT HEALTHRECORD : " + insertHr);
			System.out.println(healthRecord+"Dao");
			
			
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(insertHr == 1){
			
			logger.info("INSERT HEALTHRECORD SUCCESS");
			
			result = true;
			
		} else{
			

			logger.info("INSERT HEALTHRECORD FAIL");
			
			result = false;
			
		}
		
		
		return result;
		
	}
	
	
	
	
	
}
