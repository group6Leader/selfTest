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
		String res_Check ="";
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			cust_Num = member.getCustomer().getCust_Num();
		}
				
		//로그인 체크
		if(member != null){				
			myRes = dao.selectMyReservation(cust_Num);
			//나의 예약정보 확인
			if(myRes != null){
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
					String myReservation = year+"年"+month+"月"+date+"日"+hour+"時、" + resCheck + "に遠隔診療を予約しました。";
					session.setAttribute("myReservation", myReservation);
				}
				if(myRes.getHos_Name() != null && myRes.getCategory() != null){
					String myReservation = year+"年"+month+"月"+date+"日"+hour+"時、"+ myRes.getHos_Name() + " " + myRes.getCategory() + "診療を予約しました。";
					session.setAttribute("myReservation", myReservation);
				}
				
			}		
		}
		return "home";
		
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public String accessDenied() {

		logger.info("accessDenied 창으로 이동합니다-c");

		return "customer/accessDenied";

	}
}
