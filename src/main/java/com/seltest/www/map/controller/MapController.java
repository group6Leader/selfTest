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
		
		String latitude = request.getParameter("lat");			//위도 : yPos   36.
		String longitude = request.getParameter("lon");		//경도 : xPos   127.
		System.out.println("latitude(위도) : " + latitude);		
		System.out.println("longitude(경도) :" + longitude);
		
		Hospital hos = new Hospital();
		hos.setxPos(longitude);
		hos.setyPos(latitude);
		
		return "map/currentLocation";
	}
	
	
	
}
	
