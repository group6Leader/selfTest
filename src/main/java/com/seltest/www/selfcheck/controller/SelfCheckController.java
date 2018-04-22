package com.seltest.www.selfcheck.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.dao.CustomerDAO;
import com.seltest.www.dao.SelfCheckDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Member;
import com.seltest.www.vo.SelfCheck;

@Controller
@RequestMapping(value = "selfCheck")
public class SelfCheckController {

	@Autowired
	SelfCheckDAO selfCheckDAO;
	
	@Autowired
	CustomerDAO customerDAO;
	
	@RequestMapping(value="goSelfCheck", method = RequestMethod.GET)
	public String selfCheckForm(Model model, SelfCheck selfCheck, HttpSession session){
		
		System.out.println("selfCheckForm");
	
		Customer customer = (Customer) session.getAttribute("customer");
		System.out.println("customer: " + customer);
		
		int cust_Num = customer.getCust_Num();
		
		SelfCheck s = selfCheckDAO.searchSelfCheckOne(cust_Num);
		System.out.println(s);
		
		model.addAttribute("s", s);
		
		return "selfCheck/selfCheckForm";
	}
	
	@RequestMapping(value="goSelfCheck", method = RequestMethod.POST)
	public String selfCheckResult(SelfCheck selfCheck, HttpSession session){
		
		System.out.println("selfCheckResult");
		
		Member member = (Member) session.getAttribute("member");
		int cust_Num = member.getCustomer().getCust_Num();

		System.out.println("cust_Num: " + member.getCustomer().getCust_Num());
		
		selfCheck.setCust_Num(cust_Num);
		System.out.println(selfCheck);
		
		int a = selfCheckDAO.update(selfCheck);
		System.out.println("Update: " + a);
		
		return "redirect: goSelfCheck2";
	}
	
	@RequestMapping(value="goSelfCheck2", method = RequestMethod.GET)
	public String selfCheckForm2(){
		
		System.out.println("selfCheckForm2");
		
		return "selfCheck/selfCheckForm2";
	}
	
	@RequestMapping(value="goSelfCheck2", method = RequestMethod.POST)
	public String selfCheckResult2(SelfCheck selfCheck, HttpSession session, Model model){
		
		System.out.println("selfCheckResult2");
		
		Member member = (Member) session.getAttribute("member");
		int cust_Num = member.getCustomer().getCust_Num();

		System.out.println("cust_Num: " + member.getCustomer().getCust_Num());
		
		selfCheck.setCust_Num(cust_Num);

		int a = selfCheckDAO.update2(selfCheck);
		System.out.println("Update: " + a);

		SelfCheck s = selfCheckDAO.searchSelfCheckOne(cust_Num);
		System.out.println(s);
			
		/*String symptoms = s.getSymptom();
		System.out.println(symptoms);
		
		String[] array = symptoms.split(",");*/
		
		/*for (int i = 0; i < array.length; i++) {
			System.out.println(array[i]);			
		}*/
		
//		System.out.println(array[]);
		
		model.addAttribute("s", s);
		
		return "redirect: goSelfCheck3";
	}
	
	@RequestMapping(value="goSelfCheck3", method = RequestMethod.GET)
	public String selfCheckForm3(HttpSession session, Model model){
		
		System.out.println("selfCheckForm3");

		Member member = (Member) session.getAttribute("member");

		String cust_Id = member.getCustomer().getCust_Id();
		int cust_Num = member.getCustomer().getCust_Num();
		
		Customer c = customerDAO.searchCustomerOne(cust_Id);
		
		/*if (c.getDivision() == 2) {
			System.out.println("DOCTOR");			
		}*/
		
		SelfCheck s = selfCheckDAO.searchSelfCheckOne(cust_Num);

		System.out.println(c);
		System.out.println(s);
		
		model.addAttribute("c", c);
		model.addAttribute("s", s);
		
		return "selfCheck/selfCheckForm3";
	}
	
	@RequestMapping(value="goSelfCheckList", method = RequestMethod.GET)
	public String selfCheckList(HttpSession session, Model model){
		
		System.out.println("selfCheckList");
		
		ArrayList<SelfCheck> sList = selfCheckDAO.sList();
		
		model.addAttribute("sList", sList);
		
		return "selfCheck/selfCheckList";
	}
	
	@RequestMapping(value="readOne", method = RequestMethod.GET)
	public String readOne(HttpSession session, Model model, int cust_Num){
		
		System.out.println("readOne");
		System.out.println("cust_Num: " + cust_Num);
		
		Customer c = customerDAO.readOne(cust_Num);
		SelfCheck s = selfCheckDAO.searchSelfCheckOne(cust_Num);
		
		
		System.out.println(s);

		/*Member member = (Member) session.getAttribute("member");

		String cust_Id = member.getCustomer().getCust_Id();
		int cust_Num = member.getCustomer().getCust_Num();*/
		
		/*Customer c = customerDAO.searchCustomerOne(cust_Id);
		
		SelfCheck s = selfCheckDAO.searchSelfCheckOne(cust_Num);

		System.out.println(c);
		System.out.println(s);*/
		
		model.addAttribute("c", c);
		model.addAttribute("s", s);
		
		return "selfCheck/readOne";
	}
	
}
