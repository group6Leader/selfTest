package com.seltest.www.prescription.controller;

import static org.hamcrest.CoreMatchers.notNullValue;

import java.text.DateFormat;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.customer.controller.CustomerController;
import com.seltest.www.dao.CustomerDAO;
import com.seltest.www.dao.PrescriptionDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.HealthRecord;
import com.seltest.www.vo.Prescription;

@Controller
@RequestMapping(value = "prescription")
public class PrescriptionController {
	
	@Autowired
	CustomerDAO customerDAO;
	
	@Autowired
	PrescriptionDAO prescriptionDAO;

	private static final Logger logger = LoggerFactory.getLogger(PrescriptionController.class);
	
	@RequestMapping(value = "goPrescription", method = RequestMethod.GET)
	public String prescriptionList(Model model) {
		
		logger.info("처방전 작성으로 이동~");
		
		ArrayList<Customer> cList = customerDAO.cList();
		
		model.addAttribute("cList", cList);
		
		return "prescription/prescriptionList";
	}
		
	@RequestMapping(value="readOne", method = RequestMethod.GET)
	public String prescriptionForm(int cust_Num, Model model, HttpSession session) {
		
		logger.info("readOne으로 이동~");
		logger.info("cust_Num: {}", cust_Num);
		
		Customer customer = customerDAO.readOne(cust_Num);
		logger.info("{}", customer);
		
		Customer doctor = (Customer) session.getAttribute("customer");
		logger.info("Doctor: {}", doctor);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
			
		model.addAttribute("c", customer);
		model.addAttribute("date", dateFormat.format(date));
		model.addAttribute("d", doctor);
		
		return "prescription/prescriptionForm";
	}
	
	@RequestMapping(value="readOne2", method = RequestMethod.GET)
	public String prescriptionForm2(int cust_Num, Model model, HttpSession session) {
		
		System.out.println(cust_Num);
		Customer customer = customerDAO.readOne(cust_Num);
		
		Customer doctor = (Customer) session.getAttribute("customer");
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
			
		model.addAttribute("c", customer);
		model.addAttribute("date", dateFormat.format(date));
		model.addAttribute("d", doctor);
		
		return "prescription/prescriptionForm2";
	}
	
	@RequestMapping(value = "goPrescription", method = RequestMethod.POST)
	public String prescriptionResult(Prescription prescription) {
		
		logger.info("처방전 작성 완료");
		logger.info("{}", prescription);
		
		int insert = prescriptionDAO.insertPrescription(prescription);
		logger.info("Insert: {} ", insert);
		
		return "redirect: ../";
	}
	
	@RequestMapping(value = "goPrescription2", method = RequestMethod.POST)
	public String prescriptionResult2(Prescription prescription) {
		
		System.out.println("goPrescriptionPost");
		System.out.println(prescription);
		
		int insert = prescriptionDAO.insertPrescription(prescription);
		System.out.println("Insert: " + insert);
		
		return "prescription/prescriptionSuccess";
	}
	
	@RequestMapping(value = "prescriptionSuccess", method = RequestMethod.POST)
	public String prescriptionSuccess() {
		
		return "redirect: prescriptionSuccess";
	}
	
	@RequestMapping(value = "prescriptionResult", method = RequestMethod.GET)
	public String prescriptionResult2(HttpSession session, Model model) {
		
		logger.info("처방전 리스트로 이동~");
		
		ArrayList<Customer> cList = customerDAO.cList();

		model.addAttribute("cList", cList);
		
		return "prescription/prescriptionList2";
	}
	
	@RequestMapping(value = "prescriptionIndList", method = RequestMethod.GET)
	public String prescriptionIndList(int cust_Num, Model model, HttpSession session) {
		
		System.out.println("prescriptionIndList");
		
		System.out.println("cust_Num: " + cust_Num);
		
		ArrayList<Prescription> pList = prescriptionDAO.prescriptionIndList(cust_Num);
		session.setAttribute("cust_Num", cust_Num);
		System.out.println(pList.size());
		model.addAttribute("pList", pList);
		
		return "prescription/prescriptionIndList";
	}
	
	@RequestMapping(value = "prescriptionIndList2", method = RequestMethod.GET)
	public String prescriptionIndList2(Model model, HttpSession session) {
		
		System.out.println("prescriptionIndList2");
		
		Customer c = (Customer) session.getAttribute("customer");
		int cust_Num = c.getCust_Num();
		System.out.println(c);
		
		ArrayList<Prescription> pList = prescriptionDAO.prescriptionIndList(cust_Num);
		session.setAttribute("cust_Num", cust_Num);
		System.out.println(pList.size());
		
		model.addAttribute("pList", pList);
		
		return "prescription/prescriptionIndList";
	}
	
	@RequestMapping(value = "prescriptionIndResult", method = RequestMethod.GET)
	public String prescriptionIndResult(int pre_Num, Model model, HttpSession session) {
		
		logger.info("PresciprtionIndResult로 가기");
		
		System.out.println("pre_Num: " + pre_Num);
		
		Prescription prescription = prescriptionDAO.readOne(pre_Num);
		System.out.println(prescription);

		String med_Name = prescription.getMed_Name();
		String[] med_NameArray = med_Name.split(",");
		
		String med_Amount = prescription.getMed_Amount();
		String[] med_AmountArray = med_Amount.split(",");
		
		String med_Count = prescription.getMed_Count();
		String[] med_CountArray = med_Count.split(",");
		
		String med_Content = prescription.getMed_Content();
		String[] med_ContentArray = med_Content.split(",");
		
		ArrayList<Prescription> plist = new ArrayList<>();
		int last = med_NameArray.length;
		for(int i =0;i<last;i++){
			System.out.println("i = "+i);
			Prescription p = new Prescription();
			p.setCust_Id(prescription.getCust_Id());
			p.setCust_Num(prescription.getCust_Num());
			p.setMed_Amount(med_AmountArray[i]);
			p.setMed_Content(med_ContentArray[i]);
			p.setMed_Count(med_CountArray[i]);
			p.setMed_Name(med_NameArray[i]);
			p.setPre_Num(prescription.getPre_Num());
			plist.add(p);
		}		
		
		if(session.getAttribute("cust_Num") != null){
		int cust_Num = (int) session.getAttribute("cust_Num");
		Customer c = customerDAO.readOne(cust_Num);
		System.out.println(c);
		model.addAttribute("c", c);
		}
		model.addAttribute("pre_Num",plist.get(0).getPre_Num());
		model.addAttribute("doctor_Name",plist.get(0).getCust_Id());
	
		model.addAttribute("p", plist);
		
		return "prescription/prescriptionIndResult";
	}
	
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String deleteHR(int pre_Num, int cust_Num){
		
		logger.info("삭제~ ");
		logger.info("pre_Num: {}", pre_Num);
		logger.info("cust_Num: {}", cust_Num);
		
		int delete = prescriptionDAO.deletePS_cust(pre_Num);
		logger.info("delete: {}", delete);
		
		/*Customer customer = (Customer) session.getAttribute("customer");
		logger.info("{}", customer);*/
		
		/*if(prescriptionDAO.deletePS_cust(pre_Num)){			
			logger.info("삭제완료");
			logger.info("{}", customer);
				  
		if(customer.getDivision() == 1){				  
			ArrayList<Prescription> selectHR_cust = new ArrayList<>();
			selectHR_cust = prescriptionDAO.selectPS_cust(customer.getCust_Num());
			System.out.println("개인 진단서 출력 "+selectHR_cust);
			model.addAttribute("HR_List", selectHR_cust);
		}
		
		} else {
			System.out.println("삭제실패");
			System.out.println(dia_Num);
			HealthRecord select = new HealthRecord();
			select = healthRecordDao.selectHRone(dia_Num);
			System.out.println(select+"선택된 진단서");
			model.addAttribute("select", select);
			return "healthRecord/selectHRonePage";
		}*/
		
		return "redirect: ./prescriptionIndList?cust_Num=" + cust_Num;
	}
}
