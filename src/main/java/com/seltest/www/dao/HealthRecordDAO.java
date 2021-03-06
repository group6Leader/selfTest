package com.seltest.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seltest.www.vo.DiseaseCode;
import com.seltest.www.vo.HealthRecord;

@Repository
public class HealthRecordDAO {

	private static final Logger logger = LoggerFactory.getLogger(HealthRecordDAO.class);

	@Autowired
	SqlSession sqlSession;

	public boolean insertHealthRecord(HealthRecord healthRecord) {

		HealthRecordMapper mapper = sqlSession.getMapper(HealthRecordMapper.class);

		boolean result = false;
		int insertHr = 0;

		try {
			insertHr = mapper.insertHealthRecord(healthRecord);

			logger.info("INSERT HEALTHRECORD : " + insertHr);
			System.out.println(healthRecord + "Dao");

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (insertHr == 1) {

			logger.info("INSERT HEALTHRECORD SUCCESS");

			result = true;

		} else {

			logger.info("INSERT HEALTHRECORD FAIL");

			result = false;

		}

		return result;

	}

	public ArrayList<DiseaseCode> searchDisCode(String search) {
		HealthRecordMapper mapper = sqlSession.getMapper(HealthRecordMapper.class);

		ArrayList<DiseaseCode> disList = null;

		try {

			disList = mapper.searchDisCode(search);

			System.out.println(disList + " dao disList");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return disList;

	}

	public ArrayList<HealthRecord> selectHR_doc(String doctor_id) {
		HealthRecordMapper mapper = sqlSession.getMapper(HealthRecordMapper.class);

		ArrayList<HealthRecord> selectHR_doc = null;

		try {

			selectHR_doc = mapper.selectHR_doc(doctor_id);

			System.out.println(selectHR_doc + "dao selectHR_doc");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return selectHR_doc;

	}

	public ArrayList<HealthRecord> selectHR_cust(int cust_num) {

		HealthRecordMapper mapper = sqlSession.getMapper(HealthRecordMapper.class);

		ArrayList<HealthRecord> selectHR_cust = null;

		try {

			selectHR_cust = mapper.selectHR_cust(cust_num);

			System.out.println(selectHR_cust + "dao selectHR_cust");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return selectHR_cust;

	}
	public HealthRecord selectHRone(int dia_Num){
		
		HealthRecordMapper mapper = sqlSession.getMapper(HealthRecordMapper.class);
		
		HealthRecord select = null;
		
		try{
			
			select = mapper.selectHRone(dia_Num);
			System.out.println("개인 진단서 선택중"+select);
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return select;
		
	}
	
	public boolean deleteHR_cust(int dia_Num){
		
		HealthRecordMapper mapper = sqlSession.getMapper(HealthRecordMapper.class);
		
		
		int check = 0;
		boolean flag = false;
		try{
			check = mapper.deleteHR_cust(dia_Num);
			
			if(check == 1){
				flag = true;
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
		return flag;
	}

	
	

}
