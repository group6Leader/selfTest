package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.Prescription;

public interface PrescriptionMapper {

	int insertPrescription(Prescription prescription);

	ArrayList<Prescription> prescriptionIndList(int cust_Num);

	Prescription readOne(int pre_Num);

	public ArrayList<Prescription> selectPS_doc(String doctor_id);

	public ArrayList<Prescription> selectPS_cust(int cust_Num);

	public int deletePS_cust(int pre_Num);
}
