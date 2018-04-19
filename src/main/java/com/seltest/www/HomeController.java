package com.seltest.www;

import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.seltest.www.dao.ReservationDAO;
import com.seltest.www.vo.Member;
import com.seltest.www.vo.Reservation;


@Controller
public class HomeController {
	
	@Autowired
	ReservationDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		int cust_Num = 0;
		Reservation myRes = new Reservation();
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			cust_Num = member.getCustomer().getCust_Num();
		}
				
		//로그인 체크
		if(member != null){				
			myRes = dao.selectMyReservation(cust_Num);
			//나의 예약정보 확인
			if(myRes != null){
				int res_Check = myRes.getRes_Check();
				String resCheck = "";
					if(res_Check == 1)	resCheck = "병원진료";
					if(res_Check == 2) resCheck = "원격진료";
				String my_Res = myRes.getRes_Date();
				String year = my_Res.substring(0, 4);
				String month = my_Res.substring(4, 6);
				String date = my_Res.substring(6, 8);
				String hour = my_Res.substring(8, 10);
				String myReservation = year+"년 "+month+"월 "+date+"일 "+hour+"시 " +resCheck+ "를 예약하셨습니다.";
				session.setAttribute("myReservation", myReservation);
			}		
		}
		return "home";
	
	}
}
