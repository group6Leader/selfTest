package com.seltest.www.healthRecord.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.seltest.www.dao.CustomerDAO;
import com.seltest.www.dao.HealthRecordDAO;
import com.seltest.www.dao.ReservationDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.DiseaseCode;
import com.seltest.www.vo.Find;
import com.seltest.www.vo.HealthRecord;
import com.seltest.www.vo.Reservation;

@Controller
@RequestMapping(value = "healthRecord")
@SessionAttributes("customer")
public class HealthRecordController {

	@Autowired
	HealthRecordDAO healthRecordDao;
	
	@Autowired
	ReservationDAO reservationDAO;
	
	@Autowired
	CustomerDAO customerDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(HealthRecordController.class);
	
	@RequestMapping(value = "goHealthRecord", method = RequestMethod.GET)
	public String goHealthRecord(Model model , HttpSession session ,HealthRecord healthRecord) {

		logger.info("HealthRecord form으로 이동합니다-c");

		  Customer doctor = (Customer) session.getAttribute("customer");
		  
		  System.out.println(doctor);
		  
		  HealthRecord record = new HealthRecord();
		  
		
		  record.setCust_Id(doctor.getCust_Id());
		  
		  model.addAttribute("record", record);
		
		return "healthRecord/healthRecordForm";

	}
	
	
	@RequestMapping(value = "insertHealthRecord", method = RequestMethod.POST)
	public String insertHealthRecord(HealthRecord healthRecord) {

		logger.info("HealthRecord insert 중 c");
		
		System.out.println(healthRecord);
		
		healthRecordDao.insertHealthRecord(healthRecord);
		
		
		
		return "redirect:/";

	}
	
	@ResponseBody
	@RequestMapping(value = "dis_Category_chk", method = RequestMethod.POST)
	public ArrayList<DiseaseCode> dis_Category_chk(String dis_Category) {
		ArrayList<DiseaseCode> disCode = new ArrayList<DiseaseCode>();
		
		
		logger.info("찾는중 : 질병코드  {}", dis_Category);

		String search = dis_Category.toUpperCase();
	
		if (search == "") {
			return disCode;
		}
		
		disCode = healthRecordDao.searchDisCode(search);

		return disCode;
	}
	
	/*@ResponseBody*/
	@RequestMapping(value="findCust", method = RequestMethod.GET)
	public String findCust(HttpSession session, Model model){
		
		
		logger.info("찾는중 : 환자 ");
		
		Customer doctor = (Customer) session.getAttribute("customer");
		
		System.out.println(doctor);
		
		HealthRecord record = new HealthRecord();
		record.setCust_Id(doctor.getCust_Id());
		 
		String doc_Id = doctor.getCust_Id();
		
		
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		
		list = reservationDAO.selectReservation(doc_Id);
		
		System.out.println(list);
		model.addAttribute("list", list);
		
		return "healthRecord/docReserveList";
	}

	@ResponseBody
	@RequestMapping(value="nameSearch", method = RequestMethod.POST)
	public Find nameSearch(int search_Num ,Customer customer,Model model,Find find){
		
		
		logger.info("찾는중 : 환자이름 ");
		
		
		
		System.out.println(search_Num);
		
		Customer findCust = new Customer();
		
		findCust = customerDAO.readOne(search_Num);
		
		String findName = findCust.getCust_Name();
		
		Reservation findReserve= reservationDAO.selectMyReservation(search_Num);
		
		
		find.setFindName(findName);
		find.setHos_Name(findReserve.getHos_Name());
		find.setHos_Address(findReserve.getHos_Addr());
		find.setHos_Phone(findReserve.getHos_Phone());

		System.out.println(find+"찾았습니다.");
		
		return find;
	}
	
	@RequestMapping(value = "goHealthRecordList", method = RequestMethod.GET)
	public String goHealthRecordList(Model model , HttpSession session ,HealthRecord healthRecord) {

		logger.info("HealthRecord form으로 이동합니다-c");

		  Customer customer = (Customer) session.getAttribute("customer");
		  
		  System.out.println(customer);
		  
		  if(customer.getDivision()==1){
		  ArrayList<HealthRecord> selectHR_cust = new ArrayList<>();
		
		  selectHR_cust = healthRecordDao.selectHR_cust(customer.getCust_Num());
		 
		  System.out.println("개인 진단서 출력 "+selectHR_cust);
		  
		  model.addAttribute("HR_List", selectHR_cust);
		  
		  }else if(customer.getDivision()==2){
		  ArrayList<HealthRecord> selectHR_doc = new ArrayList<>();
			  
		  
		  selectHR_doc = healthRecordDao.selectHR_doc(customer.getCust_Id());
		  
		  System.out.println("의사 진단서 리스트 출력 "+selectHR_doc);
		  
		  model.addAttribute("HR_List", selectHR_doc);
		  }
		  
		  
		  
		
		return "healthRecord/healthRecordList";

	}
	
	@RequestMapping(value="selectHRone", method = RequestMethod.GET)
	public String selectHRone(int dia_Num , Model model){
		
		
		logger.info("선택중 : 진단서 ");
		
		System.out.println(dia_Num);
		
		HealthRecord select = new HealthRecord();
		
		select = healthRecordDao.selectHRone(dia_Num);
		
		System.out.println(select+"선택된 진단서");
		
		model.addAttribute("select", select);
		
		return "healthRecord/selectHRonePage";
	}
	
	@RequestMapping(value="deleteHR", method = RequestMethod.GET)
	public String deleteHR(int dia_Num , Model model , HttpSession session){
		
		
		logger.info("삭제중 : 진단서 ");
		
		System.out.println(dia_Num);
		
		Customer customer = (Customer) session.getAttribute("customer");
		
		if(healthRecordDao.deleteHR_cust(dia_Num)){
			
			System.out.println("삭제완료");
			
			
			  
			  System.out.println(customer);
			  
			  if(customer.getDivision()==1){
			  ArrayList<HealthRecord> selectHR_cust = new ArrayList<>();
			
			  selectHR_cust = healthRecordDao.selectHR_cust(customer.getCust_Num());
			 
			  System.out.println("개인 진단서 출력 "+selectHR_cust);
			  
			  model.addAttribute("HR_List", selectHR_cust);
			  
			  }
			
		}else{
			
			System.out.println("삭제실패");
			
			System.out.println(dia_Num);
			
			HealthRecord select = new HealthRecord();
			
			select = healthRecordDao.selectHRone(dia_Num);
			
			System.out.println(select+"선택된 진단서");
			
			model.addAttribute("select", select);
			
			return "healthRecord/selectHRonePage";
		}
		
		
		return "healthRecord/healthRecordList";
	}
	
}
