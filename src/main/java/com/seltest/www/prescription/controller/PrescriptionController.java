package com.seltest.www.prescription.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.vo.Customer;

@Controller
@RequestMapping(value = "prescription")
public class PrescriptionController {
	
	@RequestMapping(value="goPrescription", method = RequestMethod.GET)
	public String prescriptionForm(HttpSession session) {
		
		System.out.println("PrescriptionForm");
		
		Customer c = (Customer)session.getAttribute("customer");
		System.out.println(c);
		
		return "prescription/prescriptionForm";
	}
		
	

}
