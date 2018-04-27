package com.seltest.www.reservation.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.vo.Member;
import com.seltest.www.vo.Reservation;
import net.sf.json.JSONArray;
import com.seltest.www.dao.ReservationDAO;

@Controller
@RequestMapping(value = "reservation")
public class ReservationController {

	@Autowired
	ReservationDAO dao;
		
	//환자용 예약 페이지
	@RequestMapping(value="book", method = RequestMethod.GET)
	public String book(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model){
		String selectedDate = request.getParameter("selectedDate");
		int cust_Num = 0;
			//오늘 날짜는 직접 입력, 클릭학 날짜는 selectedDate로 받아 입력
			if(selectedDate == null || selectedDate == ""){
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
				int today = Integer.parseInt(sdf.format(cal.getTime()));
				selectedDate = String.valueOf(today);
			}else{
				String yearStr = selectedDate.substring(11, 15);
				String monthStr = selectedDate.substring(4, 7);
				if(monthStr.equals("Jan")) monthStr = "01";			
				if(monthStr.equals("Feb")) monthStr = "02";			
				if(monthStr.equals("Mar")) monthStr = "03";			
				if(monthStr.equals("Apr")) monthStr = "04";			
				if(monthStr.equals("May")) monthStr = "05";
				if(monthStr.equals("Jun")) monthStr = "06";
				if(monthStr.equals("Jul")) monthStr = "07";
				if(monthStr.equals("Aug")) monthStr = "08";
				if(monthStr.equals("Sep")) monthStr = "09";
				if(monthStr.equals("Oct")) monthStr = "10";
				if(monthStr.equals("Nov")) monthStr = "11";
				if(monthStr.equals("Dec")) monthStr = "12";
				String dateStr = selectedDate.substring(8, 10);
				selectedDate = yearStr + monthStr + dateStr;	
			}
			session.setAttribute("selectedDate", selectedDate);
			Member member = (Member) session.getAttribute("member");
			if(member != null){
				cust_Num = member.getCustomer().getCust_Num();
			}
			
			Reservation myRes = new Reservation();
			
			//로그인 체크
			if(member != null){			
				myRes = dao.selectMyReservation(cust_Num);
				//나의 예약정보 확인
				if(myRes != null){
					String haveRes = "예약 정보가 이미 존재합니다.";
					model.addAttribute("haveRes", haveRes);
					//int res_Check = myRes.getRes_Check();
					/*String resCheck = "";
						if(res_Check == 1)	resCheck = "병원진료";
						if(res_Check == 2) resCheck = "원격진료";*/
					String my_Res = myRes.getRes_Date();
					String year = my_Res.substring(0, 4);
					String month = my_Res.substring(4, 6);
					String date = my_Res.substring(6, 8);
					String hour = my_Res.substring(8, 10);
					String myReservation = year+"년 "+month+"월 "+date+"일 "+hour+"시"+ " 예약하셨습니다.";					
					model.addAttribute("myReservation", myReservation);
					session.setAttribute("myReservation", myReservation);
				}				
			}
								
		return "reservation/book";
	}
	
	//의사용 예약확인 페이지
	@RequestMapping(value="book2", method = RequestMethod.GET)
	public String book2(HttpSession session, Model model){
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		list = dao.selectReservation();
		model.addAttribute("list", list);
		return "reservation/book";
	}
	
	//예약 하기
	@RequestMapping(value="reservation", method = RequestMethod.GET)
	public String revservation(HttpSession session, Model model, HttpServletRequest request){
				
			String selectRes = request.getParameter("selectRes");
			int res_Check = 0;
			int cust_Num = 0;
			Member member = (Member) session.getAttribute("member");
			if(member != null){
				cust_Num = member.getCustomer().getCust_Num();
			}
		
			Reservation myRes = new Reservation();
			myRes = dao.selectMyReservation(cust_Num);
			//나의 예약정보 확인
			if(myRes != null){				
				return "reservation/book";
			}
		
			
			if(selectRes.equals("병원진료")){
				res_Check = 1; 
			}
			if(selectRes.equals("원격진료")){
				res_Check = 2;
			}
			
			String hourStr = request.getParameter("hour");
			String hour = "";
			if(hourStr.contains("9")){
				hour = "09";
			}else{
				hour = hourStr.substring(0, 2);
			}
			
			String selectedDate = (String)session.getAttribute("selectedDate");
			String res_Date = selectedDate + hour;
			Reservation res = new Reservation();
			
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyMMddHH");
			int today = Integer.parseInt(sdf.format(cal.getTime()));
			int selectedDay = Integer.parseInt(res_Date);
			if(selectedDay <= today){
				String resErrorMsg = "예약 불가합니다.";
				model.addAttribute("resErrorMsg", resErrorMsg);
			}
				
			res.setRes_Date(res_Date);
			//res.setRes_Hos("차병원");
			
			res.setCust_Num(cust_Num);
			//res.setRes_Check(res_Check);
			int result = 0;
			result = dao.insertReservation(res);
			if(result == 1){
				session.removeAttribute(selectedDate);
				myRes = new Reservation();
				
				//로그인 체크
				if(member != null){			
					myRes = dao.selectMyReservation(cust_Num);
					//나의 예약정보 확인
					if(myRes != null){
						//res_Check = myRes.getRes_Check();
						String resCheck = "";
							if(res_Check == 1)	resCheck = "병원진료";
							if(res_Check == 2) resCheck = "원격진료";
						String my_Res = myRes.getRes_Date();
						String year = my_Res.substring(0, 4);
						String month = my_Res.substring(4, 6);
						String date = my_Res.substring(6, 8);
						hour = my_Res.substring(8, 10);
						String myReservation = year+"년 "+month+"월 "+date+"일 "+hour+"시 " +resCheck+ "를 예약하셨습니다.";					
						model.addAttribute("myReservation", myReservation);
						session.setAttribute("myReservation", myReservation);
					}
				}
				System.out.println("예약 완료");
			}else{
				session.removeAttribute(selectedDate);
				System.out.println("예약 실패");
				return "reservation/book";
			}
						
			return "redirect:book";
	}
	
	//예약 삭제
	@RequestMapping(value="deleteBook", method = RequestMethod.GET)
	public String deleteBook(HttpSession session, Model model){
		int cust_Num = 0;
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			cust_Num = member.getCustomer().getCust_Num();
		}
				
		Reservation myRes = new Reservation();
		int result = 0;		
		
		//로그인 체크
		if(member != null){				
			myRes = dao.selectMyReservation(cust_Num);
			//나의 예약정보 확인
			if(myRes != null){
				cust_Num = myRes.getCust_Num();
				int res_Num = myRes.getRes_Num();
				Reservation res = new Reservation();
				res.setCust_Num(cust_Num);
				res.setRes_Num(res_Num);
				result = dao.deleteReservation(res);
				if(result != 0){
					System.out.println("예약 삭제 성공");
					session.removeAttribute("myReservation");
					return "redirect:book";
				}else{
					System.out.println("예약 삭제 실패");
					return "reservation/book";
				}
			}
		}
		return "redirect:book";
	}
	
}
