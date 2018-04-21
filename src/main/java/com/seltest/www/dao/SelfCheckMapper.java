package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.SelfCheck;

public interface SelfCheckMapper {

	int insertSelfCheck(SelfCheck selfCheck);
	
	int update(SelfCheck selfCheck);
	
	int update2(SelfCheck selfCheck);
	
	SelfCheck searchSelfCheckOne(int cust_Num);
	
	ArrayList<SelfCheck> sList();
	
}
