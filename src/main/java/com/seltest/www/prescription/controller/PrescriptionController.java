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
		
		ArrayList<Customer> cList = customerDAO.cList();
		
		model.addAttribute("cList", cList);
		
		return "prescription/prescriptionList";
	}
		
	@RequestMapping(value="readOne", method = RequestMethod.GET)
	public String prescriptionForm(int cust_Num, Model model) {
		
		System.out.println("readOne");
		
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
		
		System.out.println("goPrescriptionPost");
		
		System.out.println(prescription);
		
		int insert = prescriptionDAO.insertPrescription(prescription);
		System.out.println("Insert: " + insert);
		
		return "redirect: ../";
	}
	
	@RequestMapping(value = "prescriptionResult", method = RequestMethod.GET)
	public String prescriptionResult2(HttpSession session, Model model) {
		
		System.out.println("prescriptionResult");
		
		ArrayList<Customer> cList = customerDAO.cList();

		model.addAttribute("cList", cList);
		
		return "prescription/prescriptionList2";
	}
	
	@RequestMapping(value = "prescriptionIndList", method = RequestMethod.GET)
	public String prescriptionIndList(int cust_Num, Model model, HttpSession session) {
		
		System.out.println("prescriptionIndList");
		
		System.out.println("cust_Num: " + cust_Num);
		
		ArrayList<Prescription> pList = prescriptionDAO.prescriptionIndList(cust_Num);
		session.setAttribute("cust_Num", cust_Num);
		System.out.println(pList.size());
		
		model.addAttribute("pList", pList);
		
		return "prescription/prescriptionIndList";
	}
	
	@RequestMapping(value = "prescriptionIndList2", method = RequestMethod.GET)
	public String prescriptionIndList2(Model model, HttpSession session) {
		
		System.out.println("prescriptionIndList2");
		
		Customer c = (Customer) session.getAttribute("customer");
		int cust_Num = c.getCust_Num();
		System.out.println(c);
		
		ArrayList<Prescription> pList = prescriptionDAO.prescriptionIndList(cust_Num);
		session.setAttribute("cust_Num", cust_Num);
		System.out.println(pList.size());
		
		model.addAttribute("pList", pList);
		
		return "prescription/prescriptionIndList";
	}
	
	@RequestMapping(value = "prescriptionIndResult", method = RequestMethod.GET)
	public String prescriptionIndResult(int pre_Num, Model model, HttpSession session) {
		
		System.out.println("prescriptionIndResult");
		
		System.out.println("pre_Num: " + pre_Num);
		
		Prescription p = prescriptionDAO.readOne(pre_Num);
		System.out.println(p);
		
		String med_Name = p.getMed_Name();
		String[] med_NameArray = med_Name.split(",");
		
		int cust_Num = (int) session.getAttribute("cust_Num");
		Customer c = customerDAO.readOne(cust_Num);
		System.out.println(c);
		
		model.addAttribute("p", p);
		model.addAttribute("c", c);
		
		return "prescription/prescriptionIndResult";
	}
}
