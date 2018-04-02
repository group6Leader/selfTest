package com.seltest.www.customer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "customer")
public class CustomerController {

	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	
	@RequestMapping(value="goJoin" , method = RequestMethod.GET)
	public String divMember(){
		
		logger.info("회원가입 창으로 이동합니다-c");
		
		return "customer/joinCustomer";
		
	}
	
	
}
