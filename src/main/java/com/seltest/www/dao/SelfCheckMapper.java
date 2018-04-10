package com.seltest.www.dao;

import com.seltest.www.vo.SelfCheck;

public interface SelfCheckMapper {

	public int insertSelfCheck(SelfCheck selfCheck);
	
	SelfCheck readOne(int cust_Num);
	
}
