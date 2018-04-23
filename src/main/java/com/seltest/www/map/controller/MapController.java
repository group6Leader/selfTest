package com.seltest.www.map.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seltest.www.vo.Hospital;
import com.seltest.www.vo.HospitalParser;

import net.sf.json.JSONArray;


@Controller
@RequestMapping(value = "mapping")
public class MapController {

			
	@RequestMapping(value="map", method = RequestMethod.GET)
	public String map(HttpSession session, Model model){		
			
		return "map/currentLocation";
	}
	
	@ResponseBody
	@RequestMapping(value="currentLocation", method = RequestMethod.GET)
	public JSONArray currentLocation(HttpSession session, Model model, HttpServletRequest request
			, String yadmNm, String DgsbjtCd, String sgguCdNm, int radius){
		
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
		HospitalParser hp = new HospitalParser();
		Hospital search = new Hospital();
		search.setxPos(longitude);
		search.setyPos(latitude);
		search.setNumOfRows(1000);
		search.setDgsbjtCd("49");
		search.setSidoCd("110000");
		search.setRadius(3000);
		
		ArrayList<Hospital> hosList = hp.HospitalParser1(search);
		JSONArray jsonArray = new JSONArray();
		jsonArray.addAll(hosList);
		System.out.println(jsonArray);		
		
		return jsonArray;
	}
	
	
}
	
