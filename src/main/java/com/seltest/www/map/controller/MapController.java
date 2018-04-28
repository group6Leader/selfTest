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
	public String map(HttpSession session, Model model, String haveRes){		
				
		return "map/currentMap";
	}
	
	@RequestMapping(value="maps", method = RequestMethod.GET)
	public String maps(HttpSession session, Model model, String haveRes){		
		if(haveRes != null || haveRes != ""){
			model.addAttribute("haveRes", haveRes);
		}
		
		return "map/currentMap";
	}
	
	@ResponseBody
	@RequestMapping(value="currentLocation", method = RequestMethod.GET)
	public JSONArray currentLocation(HttpSession session, Model model, HttpServletRequest request){
		
		//현재 위도와 경도
		String latitude = request.getParameter("lat");			//위도 : yPos   36.
		String longitude = request.getParameter("lon");		//경도 : xPos   127.
		if(request.getParameter("clickedLocation") != null & request.getParameter("clickedLocation") != ""){
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
		
		if(request.getParameter("numOfRows") != null & request.getParameter("numOfRows") != ""){
			String numOfRows = null;
			switch(request.getParameter("numOfRows")){
			case "1": numOfRows = "3"; break;
			case "11": numOfRows = "10"; break;
			case "21": numOfRows = "20"; break;
			case "31": numOfRows = "50"; break;
			case "41": numOfRows = "100"; break;
			case "51": numOfRows = "200"; break;
			case "61": numOfRows = "400"; break;
			case "71": numOfRows = "800"; break;
			case "81": numOfRows = "1200"; break;
			case "91": numOfRows = "1600"; break;
			case "101": numOfRows = "2000"; break;
			}
			search.setNumOfRows(numOfRows);
		}else{
			search.setNumOfRows("3");
		}				
		if(request.getParameter("yadmNm") != null & request.getParameter("yadmNm") != ""){
			search.setYadmNm(request.getParameter("yadmNm"));
		}
		if(request.getParameter("dgsbjtCd") != null & request.getParameter("dgsbjtCd") != ""){
			search.setDgsbjtCd(request.getParameter("dgsbjtCd"));
		}else{
			search.setDgsbjtCd("01");
		}
		if(request.getParameter("sgguCd") != null & request.getParameter("sgguCd") != ""){
			search.setSgguCd(request.getParameter("sgguCd"));
		}
		if(request.getParameter("sgguCd") == null || request.getParameter("sgguCd") == ""){
			if(request.getParameter("radius") != null & request.getParameter("radius") != ""){
				String radius = null;
				switch(request.getParameter("radius")){
					case "1": radius = "1000"; break;
					case "11": radius = "2000"; break;
					case "21": radius = "3000"; break;
					case "31": radius = "4000"; break;
					case "41": radius = "5000"; break;
					case "51": radius = "6000"; break;
					case "61": radius = "7000"; break;
					case "71": radius = "8000"; break;
					case "81": radius = "9000"; break;
					case "91": radius = "10000"; break;
					case "101": radius = "20000"; break;
				}
				search.setRadius(radius);
			}else{
				search.setRadius("3000");
			}
		}
						
		ArrayList<Hospital> hosList = hp.HospitalParser1(search);
		JSONArray jsonArray = new JSONArray();
		jsonArray.addAll(hosList);
		System.out.println(jsonArray);		
		return jsonArray;
	}
	
	
}
	
