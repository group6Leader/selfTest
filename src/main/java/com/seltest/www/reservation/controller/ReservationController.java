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

import com.seltest.www.dao.CustomerDAO;
import com.seltest.www.dao.ReservationDAO;

@Controller
@RequestMapping(value = "reservation")
public class ReservationController {

	@Autowired
	ReservationDAO dao;
	@Autowired
	CustomerDAO custDao;
		
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
			
			String res_Check ="";
			//로그인 체크
			if(member != null){			
				myRes = dao.selectMyReservation(cust_Num);
				//나의 예약정보 확인
				if(myRes != null){
					String haveRes = "예약 정보가 이미 존재합니다.";
					model.addAttribute("haveRes", haveRes);					
					String my_Res = myRes.getRes_Date();
					String year = my_Res.substring(0, 4);
					String month = my_Res.substring(4, 6);
					String date = my_Res.substring(6, 8);
					String hour = my_Res.substring(8, 10);
					String resCheck = "";
					if(myRes.getCust_Id() != null){
						res_Check = myRes.getCust_Id();
						if(res_Check.equals("cha")) resCheck = "Dr차예진";
						if(res_Check.equals("jo")) resCheck = "Dr조민제";
						if(res_Check.equals("kim")) resCheck = "Dr김준형";
						if(res_Check.equals("sin")) resCheck = "Dr신동철";
						String myReservation = year+"년 "+month+"월 "+date+"일 "+hour+"시 "+ resCheck + " 에게" + " 원격진료를 예약하셨습니다.";	
						model.addAttribute("myReservation", myReservation);
						session.setAttribute("myReservation", myReservation);
					}
					
					if(myRes.getHos_Name() != null && myRes.getCategory() != null){
						String myReservation = year+"년 "+month+"월 "+date+"일 "+hour+"시 "+ myRes.getHos_Name() + " " + myRes.getCategory() + " 진료를 예약하셨습니다.";
						model.addAttribute("myReservation", myReservation);
						session.setAttribute("myReservation", myReservation);
					}
				}				
			}
								
		return "reservation/book";
	}
	
	//의사용 예약확인 페이지
	@RequestMapping(value="book2", method = RequestMethod.GET)
	public String book2(HttpSession session, Model model){
		Member member = (Member) session.getAttribute("member");
		String cust_Id = member.getCustomer().getCust_Id();
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		list = dao.selectReservation(cust_Id);
		
		model.addAttribute("list", list);	
		
		return "reservation/book";
	}
	
	//예약 하기
	@RequestMapping(value="reservation", method = RequestMethod.GET)
	public String revservation(HttpSession session, Model model, HttpServletRequest request){				
			
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
			String cust_Name = member.getCustomer().getCust_Name();
			res.setCust_Name(cust_Name);
			res.setRes_Date(res_Date);		
			res.setCust_Num(cust_Num);
			String doc_Name = request.getParameter("doctor");
			String cust_Id = "";
			if(doc_Name.equals("Dr차예진")){
				cust_Id = "cha";
			}
			if(doc_Name.equals("Dr조민제")){
				cust_Id = "jo";
			}
			if(doc_Name.equals("Dr김준형")){
				cust_Id = "kim";
			}
			if(doc_Name.equals("Dr신동철")){
				cust_Id = "sin";
			}
			res.setCust_Id(cust_Id);
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
						cust_Id = myRes.getCust_Id();
						String docName = "";
							if(cust_Id.equals("cha")) docName = "Dr 차예진";
							if(cust_Id.equals("jo")) docName = "Dr 조민제";
							if(cust_Id.equals("kim")) docName = "Dr 김준형";
							if(cust_Id.equals("sin")) docName = "Dr 신동철";
						String my_Res = myRes.getRes_Date();
						String year = my_Res.substring(0, 4);
						String month = my_Res.substring(4, 6);
						String date = my_Res.substring(6, 8);
						hour = my_Res.substring(8, 10);
						String myReservation = year+"년 "+month+"월 "+date+"일 "+hour+"시 " + docName+ "에게 원격진료를 예약하셨습니다.";					
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
	
	//예약 하기2
	@RequestMapping(value="reservation2", method = RequestMethod.GET)
	public String revservation2(HttpSession session, Model model, String yadmNm, String dgsbjtCd, String date, String time){
		System.out.println(yadmNm);
		System.out.println(dgsbjtCd);
		System.out.println(date);
		System.out.println(time);
		
		
		String hos_Name = "";
		String category = "";
		String res_Date = "";
		String hour = "";
		hos_Name = yadmNm;
		if(dgsbjtCd.equals("00")) category = "일반의";
		if(dgsbjtCd.equals("01")) category = "내과";
		if(dgsbjtCd.equals("02")) category = "신경과";
		if(dgsbjtCd.equals("03")) category = "정신건강의학과";
		if(dgsbjtCd.equals("04")) category = "외과";
		if(dgsbjtCd.equals("05")) category = "정형외과";
		if(dgsbjtCd.equals("06")) category = "신경외과";
		if(dgsbjtCd.equals("07")) category = "흉부외과";
		if(dgsbjtCd.equals("08")) category = "성형외과";
		if(dgsbjtCd.equals("10")) category = "산부인과";
		if(dgsbjtCd.equals("11")) category = "소아청소년과";
		if(dgsbjtCd.equals("12")) category = "안과";
		if(dgsbjtCd.equals("13")) category = "이비인후과";
		if(dgsbjtCd.equals("14")) category = "피부과";
		if(dgsbjtCd.equals("15")) category = "비뇨기과";
		if(dgsbjtCd.equals("49")) category = "치과";
		if(dgsbjtCd.equals("80")) category = "한방내과";
		String year = date.substring(6, 10);
		String month = date.substring(3, 5);
		String day = date.substring(0, 2);
		
		String[] split = time.split(":");
		if(split[0].length()==1){
			hour = "0" + split[0];
		}else{
			hour = split[0];
		}		
		
		if(time.contains("PM") && hour.equals("01")) hour="13";
		if(time.contains("PM") && hour.equals("02")) hour="14";
		if(time.contains("PM") && hour.equals("03")) hour="15";
		if(time.contains("PM") && hour.equals("04")) hour="16";
		if(time.contains("PM") && hour.equals("05")) hour="17";
		if(time.contains("PM") && hour.equals("06")) hour="18";
		
		res_Date = year+month+day+hour;
		System.out.println("병원: " + yadmNm);
		System.out.println("진료과목: " +category);
		System.out.println("예약일자: " + res_Date);
		int cust_Num = 0;
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			cust_Num = member.getCustomer().getCust_Num();
		}
	
		Reservation myRes = new Reservation();
		Reservation res = new Reservation();
		myRes = dao.selectMyReservation(cust_Num);
		//나의 예약정보 확인
		if(myRes != null){				
			String haveRes = "예약 정보가 이미 존재합니다.";
			model.addAttribute("haveRes", haveRes);
			return "redirect:../mapping/maps?haveRes="+haveRes;
		}
		String cust_Name = member.getCustomer().getCust_Name();
		res.setCust_Name(cust_Name);
		res.setCust_Num(cust_Num);
		res.setHos_Name(hos_Name);
		res.setRes_Date(res_Date);		
		res.setCategory(category);
		int result = 0;
		result = dao.insertReservation(res);
		if(result == 1){
			myRes = new Reservation();
			
			//로그인 체크
			if(member != null){			
				myRes = dao.selectMyReservation(cust_Num);
				//나의 예약정보 확인
				if(myRes != null){
					hos_Name = myRes.getHos_Name();
					category = myRes.getCategory();
					String my_Res = myRes.getRes_Date();
					year = my_Res.substring(0, 4);
					month = my_Res.substring(4, 6);
					day = my_Res.substring(6, 8);
					hour = my_Res.substring(8, 10);
					String myReservation = year+"년 "+month+"월 "+day+"일 "+hour+"시 " + hos_Name + category + " 진료를 예약하셨습니다.";					
					model.addAttribute("myReservation", myReservation);
					session.setAttribute("myReservation", myReservation);
				}
			}
			System.out.println("예약 완료");
			String resSuccess = "예약 완료되었습니다.";
			model.addAttribute("resSuccess", resSuccess);
			return "redirect:../mapping/mapSuccess?resSuccess="+resSuccess;
		}else{
			System.out.println("예약 실패");
			return "../map/currentMap";
		}	
		
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
