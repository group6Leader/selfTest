package com.seltest.www.map.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.vo.Hospital;
import com.seltest.www.vo.HospitalParser;


@Controller
@RequestMapping(value = "mapping")
public class MapController {

	/*@Autowired
	MapDAO dao;*/
			
	@RequestMapping(value="map", method = RequestMethod.GET)
	public String map(HttpSession session, Model model){		
			
		return "map/currentLocation";
	}
	
	@RequestMapping(value="currentLocation", method = RequestMethod.GET)
	public String currentLocation(HttpSession session, Model model, HttpServletRequest request){
		
		//현재 위도와 경도
		String latitude = request.getParameter("lat");			//위도 : yPos   36.
		String longitude = request.getParameter("lon");		//경도 : xPos   127.
		if(request.getParameter("clickedLocation") != null){
			String clickedLocation = request.getParameter("clickedLocation");
			String clickedLocation2 = clickedLocation.substring(1,clickedLocation.length()-1);
			String[] split = clickedLocation2.split(",");
			latitude = split[0];
			longitude = split[1].substring(1, split[1].length());
		}
		
		Hospital search = new Hospital();
		search.setxPos(longitude);
		search.setyPos(latitude);
		search.setNumOfRows(100);
		search.setDgsbjtCd("01");
		search.setRadius(1000);
		new HospitalParser(search);
		System.out.println("@@");
		return "map/currentLocation";
	}
	
	
}
	
