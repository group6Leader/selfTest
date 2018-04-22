package com.seltest.www.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seltest.www.vo.Prescription;

@Repository
public class PrescriptionDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertPrescription(Prescription prescription) {
		
		int result = 0;
		
		try {
			PrescriptionMapper mapper = sqlSession.getMapper(PrescriptionMapper.class);
			result = mapper.insertPrescription(prescription);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}
