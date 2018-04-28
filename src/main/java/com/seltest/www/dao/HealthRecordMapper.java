package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.DiseaseCode;
import com.seltest.www.vo.HealthRecord;

public interface HealthRecordMapper {

	
	public int insertHealthRecord(HealthRecord healthRecord);
	
	public ArrayList<DiseaseCode> searchDisCode(String search);
	
	public ArrayList<HealthRecord> selectHR_doc(String doctor_id);

	public ArrayList<HealthRecord> selectHR_cust(int cust_num);

	
	
}
