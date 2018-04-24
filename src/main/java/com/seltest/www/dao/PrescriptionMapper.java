package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.Prescription;

public interface PrescriptionMapper {

	int insertPrescription(Prescription prescription);
	
	ArrayList<Prescription> prescriptionIndList(int cust_Num);
	
	Prescription readOne(int pre_Num);
	
}
