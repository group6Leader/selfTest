package com.seltest.www.selfcheck.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.dao.SelfCheckDAO;
import com.seltest.www.vo.SelfCheck;

@Controller
@RequestMapping(value = "selfCheck")
public class SelfCheckController {

	@Autowired
	SelfCheckDAO selfCheckDAO;
	
	@RequestMapping(value="goSelfCheck", method = RequestMethod.GET)
	public String selfCheckForm(){
		
		System.out.println("selfCheckForm");
		
		return "selfCheck/selfCheckForm";
	}
	
	@RequestMapping(value="goSelfCheck", method = RequestMethod.POST)
	public String selfCheckResult(SelfCheck selfCheck, HttpSession session){
		
		System.out.println(selfCheck);
		
		int cust_Num = (int) session.getAttribute("cust_Num");
		System.out.println("cust_Num: " + cust_Num);
		/*int cust_NumInt = Integer.parseInt(cust_Num);*/
		
		selfCheck.setCust_Num(cust_Num);
		
		int a = selfCheckDAO.insertSelfCheck(selfCheck);
		System.out.println(a);
		
		return "redirect: goSelfCheck2";
	}
	
	@RequestMapping(value="goSelfCheck2", method = RequestMethod.GET)
	public String selfCheckForm2(){
		
		System.out.println("selfCheckForm2");
		
		return "selfCheck/selfCheckForm2";
	}
	
	@RequestMapping(value="goEditForm", method = RequestMethod.GET)
	public String editForm(SelfCheck selfCheck, HttpSession session, Model model){
		
		/*System.out.println("editForm");*/
		
		int cust_Num = (int) session.getAttribute("cust_Num");
		System.out.println("cust_Num: " + cust_Num);
	
		/*System.out.println("cust_Num: " + cust_Num);
		selfCheck.setCust_Num(cust_Num);
		
		int cust_Num = selfCheck.getCust_Num();*/
	
		SelfCheck s = selfCheckDAO.readOne(cust_Num);
		System.out.println(s);
		
		
		return "selfCheck/editForm";
	}
	
	@RequestMapping(value="goEditResult", method = RequestMethod.POST)
	public String editResut(){
		
		System.out.println("editResult");
		
		return "redirect: goSelfCheck2";
	}
	
}
