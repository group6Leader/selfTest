package com.seltest.www.selfcheck.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.dao.SelfCheckDAO;
import com.seltest.www.vo.Member;
import com.seltest.www.vo.SelfCheck;

@Controller
@RequestMapping(value = "selfCheck")
public class SelfCheckController {

	@Autowired
	SelfCheckDAO selfCheckDAO;
	
	@RequestMapping(value="goSelfCheck", method = RequestMethod.GET)
	public String selfCheckForm(HttpSession session, Principal principal){
		
		System.out.println("selfCheckForm");
		
//		session.setAttribute("cust_Num", 83);
//		String cust_NumString = principal.getName();
//		int cust_Num = Integer.parseInt(cust_NumString);
//		System.out.println("String Value: " + a);
//		System.out.println("1cust_Num: " + cust_Num);
//		session.setAttribute("cust_Num", cust_Num);
		
		Member member = (Member) session.getAttribute("member");
		System.out.println("Cust_Num: " + member.getCustomer().getCust_Num());
		
		return "selfCheck/selfCheckForm";
	}
	
	@RequestMapping(value="goSelfCheck", method = RequestMethod.POST)
	public String selfCheckResult(SelfCheck selfCheck, HttpSession session){
		
		System.out.println(selfCheck);
		
		int cust_Num = (int) session.getAttribute("cust_Num");
		System.out.println("2cust_Num: " + cust_Num);
		
		selfCheck.setCust_Num(cust_Num);
		
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
