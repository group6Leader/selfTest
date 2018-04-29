package com.seltest.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seltest.www.vo.HealthRecord;
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

		// System.out.println("DAOpres");

		try {
			// System.out.println("DAOpres2");
			PrescriptionMapper mapper = sqlSession.getMapper(PrescriptionMapper.class);
			prescriptionIndList = mapper.prescriptionIndList(cust_Num);

		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.out.println("DAOpres3");

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

	public ArrayList<Prescription> selectPS_doc(String doctor_id) {
		PrescriptionMapper mapper = sqlSession.getMapper(PrescriptionMapper.class);

		ArrayList<Prescription> selectPS_doc = null;

		try {

			selectPS_doc = mapper.selectPS_doc(doctor_id);

			System.out.println(selectPS_doc + "dao selectPS_doc");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return selectPS_doc;
	}

	public ArrayList<Prescription> selectPS_cust(int cust_num) {
		PrescriptionMapper mapper = sqlSession.getMapper(PrescriptionMapper.class);

		ArrayList<Prescription> selectPS_cust = null;

		try {

			selectPS_cust = mapper.selectPS_cust(cust_num);

			System.out.println(selectPS_cust + "dao selectPS_cust");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return selectPS_cust;
	}

	public int deletePS_cust(int pre_Num) {
		
		int check = 0;
//		boolean flag = false;
		
		try {
			PrescriptionMapper mapper = sqlSession.getMapper(PrescriptionMapper.class);
			check = mapper.deletePS_cust(pre_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return check;
	}
}
