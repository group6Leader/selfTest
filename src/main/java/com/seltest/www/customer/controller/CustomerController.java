package com.seltest.www.customer.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.seltest.www.dao.CustomerDAO;
import com.seltest.www.vo.Customer;

@Controller
@RequestMapping(value = "customer")
@SessionAttributes("login")
public class CustomerController {

	@Inject
	private JavaMailSender mailSender;

	@Autowired
	CustomerDAO custDao;

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping(value = "goJoin", method = RequestMethod.GET)
	public String divMember() {

		logger.info("회원가입 창으로 이동합니다-c");

		return "customer/joinCustomer";

	}

	@ResponseBody
	@RequestMapping(value = "idcheck", method = RequestMethod.POST)
	public HashMap<String, String> idcheck(String cust_Id) {
		HashMap<String, String> map = new HashMap<String, String>();
		if (cust_Id == null) {
			cust_Id = "";
		}
		logger.info("중복검사할 아이디 : {}", cust_Id);

		Customer result = custDao.searchCustomerOne(cust_Id);

		if (result != null) {
			map.put("cust_Id", cust_Id);
		} else {
			map.put("cust_Id", "");
		}

		return map;
	}

	@RequestMapping(value = "custJoin", method = RequestMethod.POST)
	public String custJoin(Customer customer, Model model, String birth_Year, String birth_Month, String birth_Day)
			throws MessagingException, UnsupportedEncodingException {

		String cust_Birth = birth_Year + "/" + birth_Month + "/" + birth_Day + "/";

		customer.setCust_Birth(cust_Birth);

		logger.info("회원가입중");

		System.out.println(customer);

		// 관리자 계정
		String admin = "pauluskim0306@gmail.com";

		// Server Address
		String serverAddress = "http://203.233.199.159:9090/www/";

		System.out.println(customer);
		boolean joinIs = custDao.insertCustomer(customer);

		if (joinIs) {

			// 인증을 위한 E-mail을 보내는 부분
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(admin); // 보내는사람 (생략 시 정상작동을 안함)
			messageHelper.setTo(customer.getCust_Email()); // 받는사람 이메일
			messageHelper.setSubject("[이메일 인증]"); // 메일제목(생략 가능)
			messageHelper.setText( // 메일 내용
					new StringBuffer()
							.append("메일인증 \n").append("CHARHospital에 가입해주셔서 감사합니다. \n" + serverAddress
									+ "customer/verify?cust_Email=" + customer.getCust_Email())
							.append("\n이메일 인증 확인").toString());
			try {

				mailSender.send(message); // 메일 보내기
			} catch (MailException e) {

				e.printStackTrace();
			}

			logger.info("User Join Success");
		} else {

			logger.info("User Join Fail");
		}

		return "customer/joincomplete";
	}

	@RequestMapping(value = "verify", method = RequestMethod.GET)
	public String verifySuccess(@RequestParam String cust_Email) {

		logger.info("E-mail Verify");
		logger.info(cust_Email);

		boolean verifyIs = custDao.verifyUser(cust_Email);

		if (verifyIs) {

			logger.info("E-mail Verify Success");
		} else {

			logger.info("E-mail Verify Fail");
		}

		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public HashMap<String, String> login(String cust_Id, String cust_Pw, HttpSession session, Model model) {

		HashMap<String, String> loginMap = new HashMap<String, String>();

		logger.info("로그인 시작");

		logger.info(cust_Id + "id" + cust_Pw + "pw");

		Customer custLogin = null;

		custLogin = custDao.searchCustomerOne(cust_Id);

		if (custLogin == null) {
			loginMap.put("message1", cust_Id + "아이디가 없습니다.");
			loginMap.put("check", "errorId");
		} else if (!custLogin.getCust_Pw().equals(cust_Pw)) {
			loginMap.put("message2", cust_Pw + "비밀번호가 다릅니다.");
			loginMap.put("check", "errorPw");
		} else {
			session.setAttribute("loginID", custLogin.getCust_Id());
			session.setAttribute("loginName", custLogin.getCust_Name());
			loginMap.put("message3", "로그인이 완료 되었습니다.");
		}

		model.addAttribute("login", custLogin);

		logger.info("로그인 종료");

		return loginMap;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		logger.info("로그아웃 시작");

		session.invalidate();

		logger.info("로그아웃 끝");

		return "redirect:/";
	}
}
