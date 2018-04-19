package com.seltest.www.selfcheck.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.dao.SelfCheckDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Member;
import com.seltest.www.vo.SelfCheck;

@Controller
@RequestMapping(value = "selfCheck")
public class SelfCheckController {

	@Autowired
	SelfCheckDAO selfCheckDAO;
	
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
		System.out.println(a);
		
		return "redirect: goSelfCheck2";
	}
	
	@RequestMapping(value="goSelfCheck2", method = RequestMethod.GET)
	public String selfCheckForm2(){
		
		System.out.println("selfCheckForm2");
		
		return "selfCheck/selfCheckForm2";
	}
	
}
