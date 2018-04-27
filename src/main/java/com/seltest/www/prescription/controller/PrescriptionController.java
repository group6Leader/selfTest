package com.seltest.www.prescription.controller;

import java.text.DateFormat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.customer.controller.CustomerController;
import com.seltest.www.dao.CustomerDAO;
import com.seltest.www.dao.PrescriptionDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.HealthRecord;
import com.seltest.www.vo.Prescription;

@Controller
@RequestMapping(value = "prescription")
public class PrescriptionController {
	
	@Autowired
	CustomerDAO customerDAO;
	
	@Autowired
	PrescriptionDAO prescriptionDAO;

	private static final Logger logger = LoggerFactory.getLogger(PrescriptionController.class);
	
	@RequestMapping(value = "goPrescription", method = RequestMethod.GET)
	public String prescriptionList(Model model) {
		
		logger.info("처방전 작성으로 이동");
		
		ArrayList<Customer> cList = customerDAO.cList();
		
		model.addAttribute("cList", cList);
		
		return "prescription/prescriptionList";
	}
		
	@RequestMapping(value="readOne", method = RequestMethod.GET)
	public String prescriptionForm(int cust_Num, Model model, HttpSession session) {
		
		System.out.println(cust_Num);
		Customer customer = customerDAO.readOne(cust_Num);
		
		Customer doctor = (Customer) session.getAttribute("customer");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
			
		model.addAttribute("c", customer);
		model.addAttribute("date", dateFormat.format(date));
		model.addAttribute("d", doctor);
		
		return "prescription/prescriptionForm";
	}
	
	@RequestMapping(value="readOne2", method = RequestMethod.GET)
	public String prescriptionForm2(int cust_Num, Model model, HttpSession session) {
		
		System.out.println(cust_Num);
		Customer customer = customerDAO.readOne(cust_Num);
		
		Customer doctor = (Customer) session.getAttribute("customer");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
			
		model.addAttribute("c", customer);
		model.addAttribute("date", dateFormat.format(date));
		model.addAttribute("d", doctor);
		
		return "prescription/prescriptionForm2";
	}
	
	@RequestMapping(value = "goPrescription", method = RequestMethod.POST)
	public String prescriptionResult(Prescription prescription) {
		
		System.out.println("goPrescriptionPost");
		System.out.println(prescription);
		
		int insert = prescriptionDAO.insertPrescription(prescription);
		System.out.println("Insert: " + insert);
		
		return "redirect: ../";
	}
	
	@RequestMapping(value = "goPrescription2", method = RequestMethod.POST)
	public String prescriptionResult2(Prescription prescription) {
		
		System.out.println("goPrescriptionPost");
		System.out.println(prescription);
		
		int insert = prescriptionDAO.insertPrescription(prescription);
		System.out.println("Insert: " + insert);
		
		return "prescription/prescriptionSuccess";
	}
	
	@RequestMapping(value = "prescriptionSuccess", method = RequestMethod.POST)
	public String prescriptionSuccess() {
		
		return "redirect: prescriptionSuccess";
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
	public String prescriptionIndList2(Model model, HttpSession session, int cust_Num) {
		
		System.out.println("prescriptionIndList2");
		
		Customer c = (Customer) session.getAttribute("customer");
		cust_Num = c.getCust_Num();
		System.out.println(c);
		
		ArrayList<Prescription> pList = prescriptionDAO.prescriptionIndList(cust_Num);
		session.setAttribute("cust_Num", cust_Num);
		System.out.println(pList.size());
		
		model.addAttribute("pList", pList);
		
		return "prescription/prescriptionIndList";
	}
	
	@RequestMapping(value = "prescriptionIndResult", method = RequestMethod.GET)
	public String prescriptionIndResult(int pre_Num, Model model, HttpSession session) {
		
		logger.info("PresciprtionIndResult로 가기");
		
		System.out.println("pre_Num: " + pre_Num);
		
		Prescription p = prescriptionDAO.readOne(pre_Num);
		System.out.println(p);
		
		String med_Name = p.getMed_Name();
		String[] med_NameArray = med_Name.split(",");
		model.addAttribute("med_Name", med_NameArray);
		
		String med_Amount = p.getMed_Amount();
		String[] med_AmountArray = med_Amount.split(",");
		model.addAttribute("med_Amount", med_AmountArray);
		
		String med_Count = p.getMed_Count();
		String[] med_CountArray = med_Count.split(",");
		model.addAttribute("med_Count", med_CountArray);
		
		String med_Content = p.getMed_Content();
		String[] med_ContentArray = med_Content.split(",");
		model.addAttribute("med_Content", med_ContentArray);
		
		int cust_Num = (int) session.getAttribute("cust_Num");
		Customer c = customerDAO.readOne(cust_Num);
		System.out.println(c);
		
		model.addAttribute("p", p);
		model.addAttribute("c", c);
		
		return "prescription/prescriptionIndResult";
	}
}
