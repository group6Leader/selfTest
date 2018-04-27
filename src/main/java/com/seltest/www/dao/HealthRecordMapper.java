package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.DiseaseCode;
import com.seltest.www.vo.HealthRecord;

public interface HealthRecordMapper {

	
	public int insertHealthRecord(HealthRecord healthRecord);
	
	public ArrayList<DiseaseCode> searchDisCode(String search);
	
	
}
