package com.seltest.www.reservation.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.seltest.www.vo.Reservation;
import com.seltest.www.dao.ReservationDAO;

@Controller
@RequestMapping(value = "reservation")
public class ReservationController {

	@Autowired
	ReservationDAO dao;
			
	@RequestMapping(value="book", method = RequestMethod.GET)
	public String book(HttpSession session, Model model){
		//session.getAttribute("cust_Id");
		//session.setAttribute("cust_Id", 1);
		//session.getAttribute("cust_Num");
		ArrayList<Reservation> myList = new ArrayList<Reservation>();
		myList = dao.selectMyReservation(1);
		if(myList != null){
			String haveRes = "haveRes";
			model.addAttribute("haveRes", haveRes);
			return "reservation/book";
		}
		
		return "reservation/book";
	}
	
	@RequestMapping(value="hour", method = RequestMethod.GET)
	public String hour(String iUseDate, HttpSession session, Model model){
		session.setAttribute("iUseDate", iUseDate);
		ArrayList<String> hourList = new ArrayList<String>();
		ArrayList<Reservation> checkList = new ArrayList<Reservation>();
			
		checkList = dao.checkReservation(iUseDate);
		for(int i=0; i<checkList.size(); i++){			
			String res = checkList.get(i).getRes_Date();
			String res_Date = res.substring(0, 8);
			String res_Hour = res.substring(8, 10);
			hourList.add(res_Hour);
			System.out.println(res);
			System.out.println(res_Date);
			System.out.println(res_Hour);					
			}

		model.addAttribute("hourList", hourList);
		System.out.println(hourList);		
		
		return "reservation/hour";
	}
	
	@RequestMapping(value="reservation", method = RequestMethod.GET)
	public String revservation(HttpSession session, String hour, Model model){
		
			String iUseDate = (String)session.getAttribute("iUseDate");
			String res_Date = iUseDate + hour;
			Reservation res = new Reservation();	
			res.setRes_Date(res_Date);
			res.setRes_Hos("차병원");
			//session.getAttribute("cust_Num");
			res.setCust_Num(1);
			System.out.println(res_Date);			
			System.out.println(res);
			
			int result = 0;
			result = dao.insertReservation(res);
			if(result == 1){
				String msg = "예약 완료";
				session.removeAttribute(iUseDate);
				model.addAttribute("successMsg", msg);
				System.out.println("예약 완료");
			}else{
				String errorMsg = "예약 실패";
				session.removeAttribute(iUseDate);
				model.addAttribute("errorMsg", errorMsg);
				System.out.println("예약 실패");
				return "hour";
			}
						
			return "redirect:../";
	}
	
	@RequestMapping(value="updateBook", method = RequestMethod.GET)
	public String updateBook(HttpSession session, Model model){
		//session.getAttribute("cust_Id");
		//session.setAttribute("cust_Id", 1);
		//session.getAttribute("cust_Num");
		ArrayList<Reservation> myList = new ArrayList<Reservation>();
		myList = dao.selectMyReservation(1);
		if(myList != null){
			String haveRes = "haveRes";
			model.addAttribute("haveRes", haveRes);
			return "reservation/book";
		}
		
		return "reservation/book";
	}
}
