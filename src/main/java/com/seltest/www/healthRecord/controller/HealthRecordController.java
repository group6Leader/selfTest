package com.seltest.www.healthRecord.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.seltest.www.dao.HealthRecordDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.HealthRecord;

@Controller
@RequestMapping(value = "healthRecord")
@SessionAttributes("customer")
public class HealthRecordController {

	@Autowired
	HealthRecordDAO healthRecordDao;
	
	private static final Logger logger = LoggerFactory.getLogger(HealthRecordController.class);
	
	@RequestMapping(value = "goHealthRecord", method = RequestMethod.GET)
	public String goHealthRecord(Model model , HttpSession session ,HealthRecord healthRecord) {

		logger.info("HealthRecord form으로 이동합니다-c");

		  Customer doctor = (Customer) session.getAttribute("customer");
		  
		  System.out.println(doctor);
		  
		  HealthRecord record = new HealthRecord();
		  
		
		  record.setCust_Id(doctor.getCust_Id());
		  
		  model.addAttribute("record", record);
		
		return "healthRecord/healthRecordForm";

	}
	
	@ResponseBody
	@RequestMapping(value = "insertHealthRecord", method = RequestMethod.POST)
	public String insertHealthRecord(HealthRecord healthRecord) {

		logger.info("HealthRecord insert 중 c");

		
		logger.info(""+healthRecord);
		
		
		
		
		return "healthRecordForm";

	}
	
	
}
