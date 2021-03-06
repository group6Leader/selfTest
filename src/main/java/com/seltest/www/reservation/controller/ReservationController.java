package com.seltest.www.reservation.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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
					String haveRes = "既に予約があります。";
					model.addAttribute("haveRes", haveRes);					
					String my_Res = myRes.getRes_Date();
					String year = my_Res.substring(0, 4);
					String month = my_Res.substring(4, 6);
					String date = my_Res.substring(6, 8);
					String hour = my_Res.substring(8, 10);
					String resCheck = "";
					if(myRes.getCust_Id() != null){
						res_Check = myRes.getCust_Id();
						if(res_Check.equals("cha")) resCheck = "Drチャ‧イェジン";
						if(res_Check.equals("jo")) resCheck = "Drジョ‧ミンジェ";
						if(res_Check.equals("kim")) resCheck = "Drキム‧ジュンヒョン";
						if(res_Check.equals("sin")) resCheck = "Drシン‧ドンチュル";
						String myReservation = year+"年"+month+"月"+date+"日"+hour+"時、"+ resCheck + "に" + "遠隔診療を予約しました。";	
						model.addAttribute("myReservation", myReservation);
						session.setAttribute("myReservation", myReservation);
					}
					
					if(myRes.getHos_Name() != null && myRes.getCategory() != null){
						String myReservation = year+"年"+month+"月"+date+"日"+hour+"時"+ myRes.getHos_Name() + " " + myRes.getCategory() + "診療を予約しました。";
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
				String resErrorMsg = "予約が出来ません。";
				model.addAttribute("resErrorMsg", resErrorMsg);
			}
			String cust_Name = member.getCustomer().getCust_Name();
			res.setCust_Name(cust_Name);
			res.setRes_Date(res_Date);		
			res.setCust_Num(cust_Num);
			String doc_Name = request.getParameter("doctor");
			String cust_Id = "";
			if(doc_Name.equals("Drチャ‧イェジン")){
				cust_Id = "cha";
			}
			if(doc_Name.equals("Drジョ‧ミンジェ")){
				cust_Id = "jo";
			}
			if(doc_Name.equals("Drキム‧ジュンヒョン")){
				cust_Id = "kim";
			}
			if(doc_Name.equals("Drシン‧ドンチュル")){
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
							if(cust_Id.equals("cha")) docName = "Drチャ‧イェジン";
							if(cust_Id.equals("jo")) docName = "Drジョ‧ミンジェ";
							if(cust_Id.equals("kim")) docName = "Drキム‧ジュンヒョン";
							if(cust_Id.equals("sin")) docName = "Drシン‧ドンチュル";
						String my_Res = myRes.getRes_Date();
						String year = my_Res.substring(0, 4);
						String month = my_Res.substring(4, 6);
						String date = my_Res.substring(6, 8);
						hour = my_Res.substring(8, 10);
						String myReservation = year+"年"+month+"月"+date+"日"+hour+"時、" + docName+ "に遠隔診療を予約しました。";					
						model.addAttribute("myReservation", myReservation);
						session.setAttribute("myReservation", myReservation);
					}
				}
				System.out.println("予約完了");
			}else{
				session.removeAttribute(selectedDate);
				System.out.println("予約失敗");
				return "reservation/book";
			}
						
			return "redirect:book";
	}
	
	//예약 하기2
	@RequestMapping(value="reservation2", method = RequestMethod.GET)
	public String revservation2(HttpSession session, Model model, String yadmNm, String dgsbjtCd, String date, String time,
		String hos_Addr, String hos_Homepage, String hos_Phone){
		System.out.println(yadmNm);
		System.out.println(dgsbjtCd);
		System.out.println(date);
		System.out.println(time);
		System.out.println(hos_Addr);
		System.out.println(hos_Homepage);
		System.out.println(hos_Phone);
		
		
		String hos_Name = "";
		String category = "";
		String res_Date = "";
		String hour = "";
		hos_Name = yadmNm;
		if(dgsbjtCd.equals("00")) category = "一般診療";
		if(dgsbjtCd.equals("01")) category = "内科";
		if(dgsbjtCd.equals("02")) category = "神経科";
		if(dgsbjtCd.equals("03")) category = "精神医学科";
		if(dgsbjtCd.equals("04")) category = "外科";
		if(dgsbjtCd.equals("05")) category = "整形外科";
		if(dgsbjtCd.equals("06")) category = "神経外科";
		if(dgsbjtCd.equals("07")) category = "胸部外科";
		if(dgsbjtCd.equals("08")) category = "美容外科";
		if(dgsbjtCd.equals("10")) category = "産婦人科";
		if(dgsbjtCd.equals("11")) category = "小児科";
		if(dgsbjtCd.equals("12")) category = "眼科";
		if(dgsbjtCd.equals("13")) category = "耳鼻咽喉科";
		if(dgsbjtCd.equals("14")) category = "皮膚科";
		if(dgsbjtCd.equals("15")) category = "泌尿器科";
		if(dgsbjtCd.equals("49")) category = "歯科";
		if(dgsbjtCd.equals("80")) category = "漢方内科";
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
		
		if(hos_Addr !=null || hos_Addr!=""){
			res.setHos_Addr(hos_Addr);
		}
		if(hos_Homepage != null || hos_Homepage != ""){
			res.setHos_Homepage(hos_Homepage);
		}
		if(hos_Phone != null || hos_Phone != ""){
			res.setHos_Phone(hos_Phone);
		}
		res.setCust_Id("cha");
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
					String myReservation = year+"年"+month+"月"+day+"日"+hour+"時、" + hos_Name + category + "診療を予約しました。";					
					model.addAttribute("myReservation", myReservation);
					session.setAttribute("myReservation", myReservation);
				}
			}
			System.out.println("예약 완료");
			String resSuccess = "予約完了";
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
	
	@Resource(name="uploadPath")
    String uploadPath;
	
	@RequestMapping(value = "download", method = {RequestMethod.GET,RequestMethod.POST} )
	public void fileDownload(HttpServletResponse response, String saved){
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(saved, "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String fullPath = uploadPath + saved;
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
