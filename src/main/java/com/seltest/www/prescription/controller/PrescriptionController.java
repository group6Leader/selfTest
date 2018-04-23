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
import com.seltest.www.dao.PrescriptionDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Prescription;

@Controller
@RequestMapping(value = "prescription")
public class PrescriptionController {
	
	@Autowired
	CustomerDAO customerDAO;
	
	@Autowired
	PrescriptionDAO prescriptionDAO;
	
	@RequestMapping(value = "goPrescription", method = RequestMethod.GET)
	public String prescriptionList(Model model) {
		
		System.out.println("prescriptionList");
		
		ArrayList<Customer> cList = customerDAO.cList();
		
		model.addAttribute("cList", cList);
		
		return "prescription/prescriptionList";
	}
		
	@RequestMapping(value="readOne", method = RequestMethod.GET)
	public String prescriptionForm(int cust_Num, Model model) {
		
		System.out.println("prescriptionForm");
		
		System.out.println(cust_Num);
		Customer c = customerDAO.readOne(cust_Num);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
			
		model.addAttribute("c", c);
		model.addAttribute("date", dateFormat.format(date));
		
		return "prescription/prescriptionForm";
	}
	
	@RequestMapping(value = "goPrescription", method = RequestMethod.POST)
	public String prescriptionResult(Prescription prescription) {
		
		System.out.println("prescriptionResult");
		
		System.out.println(prescription);
		
		int insert = prescriptionDAO.insertPrescription(prescription);
		System.out.println("Insert: " + insert);
		
		/*prescription.getMed_Name();*/
		
		/*String[] array = prescription.getMed_Name().split(",");
		
		for (int i = 0; i < array.length; i++) {
			System.out.println(array[i]);			
		}*/
		
		return "redirect: ../";
	}
	
	@RequestMapping(value = "prescriptionResult", method = RequestMethod.GET)
	public String prescriptionResult2() {
		
		System.out.println("prescriptionResult2");
		
		
		
		
		
		return "prescription/prescriptionResult";
	}
}
