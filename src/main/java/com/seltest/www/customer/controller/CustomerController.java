package com.seltest.www.customer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.customer.vo.Customer;
import com.seltest.www.dao.CustomerDAO;

@Controller
@RequestMapping(value = "customer")
public class CustomerController {

	@Inject		
	private JavaMailSender mailSender;
	
	@Autowired 
	CustomerDAO custDao;
	

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "goJoin", method = RequestMethod.GET)
	public String divMember() {

		logger.info("회원가입 창으로 이동합니다-c");

		return "customer/joinCustomer";

	}

	@RequestMapping(value = "custJoin", method = RequestMethod.POST)
	public String custJoin(Customer customer, Model model)  throws MessagingException , UnsupportedEncodingException{

		logger.info("회원가입중");

		
		//boolean joinIs = custDao.insertCustomer(customer)
		
		return "redirect:/";
	}

}
