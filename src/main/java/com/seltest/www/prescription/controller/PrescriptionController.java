package com.seltest.www.prescription.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.dao.CustomerDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Prescription;

@Controller
@RequestMapping(value = "prescription")
public class PrescriptionController {
	
	@Autowired
	CustomerDAO customerDAO;
	
	@RequestMapping(value = "goPrescription", method = RequestMethod.GET)
	public String cList(Model model) {
		
		System.out.println("cList");
		
		ArrayList<Customer> cList = customerDAO.cList();
		
		model.addAttribute("cList", cList);
		
		return "prescription/prescriptionList";
	}

	/*@RequestMapping(value="goPrescription", method = RequestMethod.GET)
	public String prescriptionForm(HttpSession session) {
		
		System.out.println("PrescriptionForm");
		
		Customer c = (Customer)session.getAttribute("customer");
		System.out.println(c);
		
		return "prescription/prescriptionForm";
	}*/
	
	/*@RequestMapping(value="goPrescription", method = RequestMethod.POST)
	public String prescriptionResult() {
		
		System.out.println("PrescriptionResult");
		
		return "";
	}*/
		
	@RequestMapping(value="readOne", method = RequestMethod.GET)
	public String readOne(int cust_Num, Model model) {
		
		System.out.println("readOne");
		
		System.out.println(cust_Num);
		Customer c = customerDAO.readOne(cust_Num);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
//		System.out.println(dateFormat.format(date));
		
		/*for (int i = 0; i < 1000; i++) {
			System.out.println(i);
			i++;
		}*/
			
		model.addAttribute("c", c);
		model.addAttribute("date", dateFormat.format(date));
		
		return "prescription/readOne";
	}
	
	@RequestMapping(value = "goPrescription", method = RequestMethod.POST)
	public String prescriptionResult(Prescription prescription) {
		
		System.out.println("prescriptionResult");
		
		System.out.println(prescription);
		
		return "prescription/prescriptionResult";
	}

}
