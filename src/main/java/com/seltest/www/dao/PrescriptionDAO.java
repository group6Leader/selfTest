package com.seltest.www.dao;

import java.util.ArrayList;

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
	
	public ArrayList<Prescription> prescriptionIndList(int cust_Num) {
		
		ArrayList<Prescription> prescriptionIndList = null;
		
		System.out.println("DAOpres");
		
		try {
			System.out.println("DAOpres2");
			PrescriptionMapper mapper = sqlSession.getMapper(PrescriptionMapper.class);
			prescriptionIndList = mapper.prescriptionIndList(cust_Num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("DAOpres3");
		
		return prescriptionIndList;
	}
	
	public Prescription readOne(int pre_Num) {
		
		Prescription prescription = null;
		
		try {
			PrescriptionMapper mapper = sqlSession.getMapper(PrescriptionMapper.class);
			prescription = mapper.readOne(pre_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return prescription;
	}
	
	
}
