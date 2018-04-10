package com.seltest.www.reservation.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.seltest.www.vo.Reservation;
import net.sf.json.JSONArray;
import com.seltest.www.dao.ReservationDAO;

@Controller
@RequestMapping(value = "reservation")
public class ReservationController {

	@Autowired
	ReservationDAO dao;
			
	@RequestMapping(value="book", method = RequestMethod.GET)
	public String book(HttpSession session, Model model){
			Integer cust_Num = null;
			Reservation myRes = new Reservation();
			
			if(session.getAttribute("cust_Num") != null){
				cust_Num = (Integer)session.getAttribute("cust_Num") ;				
				myRes = dao.selectMyReservation(cust_Num);
				if(myRes != null){
					String haveRes = "이미 예약된 정보가 있습니다.";
					model.addAttribute("haveRes", haveRes);
					String my_Res = myRes.getRes_Date();
					String year = my_Res.substring(0, 4);
					String month = my_Res.substring(4, 6);
					String date = my_Res.substring(6, 8);
					String hour = my_Res.substring(8, 10);
					String myReservation = year+"년 "+month+"월 "+date+"일 "+hour+"시 예약하셨습니다.";
					model.addAttribute("myReservation", myReservation);
					return "reservation/book";
				}
			}
								
		return "reservation/book";
	}
	
	@RequestMapping(value="hour", method = RequestMethod.GET)
	public String hour(String iUseDate, HttpSession session, Model model){
		session.setAttribute("iUseDate", iUseDate);
		ArrayList<String> hourList = new ArrayList<String>();		
		ArrayList<Reservation> checkList = new ArrayList<Reservation>();
		Reservation myRes = new Reservation();
		Integer cust_Num = null;
		
		if(session.getAttribute("cust_Num") != null){
			cust_Num = (Integer)session.getAttribute("cust_Num") ;				
			myRes = dao.selectMyReservation(cust_Num);
		}
		
		checkList = dao.checkReservation(iUseDate);
		for(int i=0; i<checkList.size(); i++){			
			String res = checkList.get(i).getRes_Date();
			String res_Date = res.substring(0, 8);
			String res_Hour = res.substring(8, 10);
			hourList.add(res_Hour);		
			System.out.println(res_Hour);
			}
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("hourList", hourList);
		model.addAttribute("jsonList", jsonArray.fromObject(hourList));
		return "reservation/hour";
	}
	
	@RequestMapping(value="reservation", method = RequestMethod.GET)
	public String revservation(HttpSession session, String hour, Model model){
		
			String iUseDate = (String)session.getAttribute("iUseDate");
			String res_Date = iUseDate + hour;
			Reservation res = new Reservation();	
			res.setRes_Date(res_Date);
			res.setRes_Hos("차병원");
			int cust_Num = (Integer)session.getAttribute("cust_Num") ;
			res.setCust_Num(cust_Num);
						
			int result = 0;
			result = dao.insertReservation(res);
			if(result == 1){
				session.removeAttribute(iUseDate);
				System.out.println("예약 완료");
			}else{
				session.removeAttribute(iUseDate);
				System.out.println("예약 실패");
				return "hour";
			}
						
			return "redirect:book";
	}
	
	@RequestMapping(value="deleteBook", method = RequestMethod.GET)
	public String deleteBook(HttpSession session, Model model){
		Reservation myRes = new Reservation();
		Integer custNum = null;
		int result = 0;		
		
		if(session.getAttribute("cust_Num") != null){
			custNum = (Integer)session.getAttribute("cust_Num") ;				
			myRes = dao.selectMyReservation(custNum);
			if(myRes != null){
				int cust_Num = myRes.getCust_Num();
				int res_Num = myRes.getRes_Num();
				Reservation res = new Reservation();
				res.setCust_Num(cust_Num);
				res.setRes_Num(res_Num);
				result = dao.deleteReservation(res);
				if(result != 0){
					System.out.println("예약 삭제 성공");
					return "reservation/book";
				}else{
					System.out.println("예약 삭제 실패");
					return "reservation/book";
				}
			}
		}
		return "reservation/book";
	}
	
}
