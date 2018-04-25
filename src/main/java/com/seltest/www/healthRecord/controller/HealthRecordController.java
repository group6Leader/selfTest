package com.seltest.www.healthRecord.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.seltest.www.dao.HealthRecordDAO;

@Controller
@RequestMapping(value = "healthRecord")
@SessionAttributes("login")
public class HealthRecordController {

	@Autowired
	HealthRecordDAO healthRecordDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HealthRecordController.class);
	
	@RequestMapping(value = "goHealthRecord", method = RequestMethod.GET)
	public String goHealthRecord() {

		logger.info("HealthRecord form으로 이동합니다-c");

		return "healthRecord/healthRecordForm";

	}
	
	@ResponseBody
	@RequestMapping(value = "insertHealthRecord", method = RequestMethod.POST)
	public String insertHealthRecord() {

		logger.info("HealthRecord insert 중 c");

		
		
		
		
		
		
		return "healthRecord/healthRecordForm";

	}
	
	
}
