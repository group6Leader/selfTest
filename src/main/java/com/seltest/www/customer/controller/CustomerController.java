package com.seltest.www.customer.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.seltest.www.customer.vo.Customer;
import com.seltest.www.dao.CustomerDAO;

@Controller
@RequestMapping(value = "customer")
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

	/*@ResponseBody
	@RequestMapping(value = "idcheck", method = RequestMethod.POST)
	public String idSearch(String id, Model model) {

		logger.info("id체크-c");

		System.out.println(id);

		company = dao.searchCompany(searchId);

		if (company == null) {

			return searchId;
		}
		logger.info("id체크 종료-c");

		return null;
	}*/
	
	
	/*
	 * @comment				: 회원 가입 처리 (인증을 위한 E-mail 발송 기능 포함)
	 * @param	joinUser	: View에서 받은 회원의 개인정보를 저장한 객체
	 * @author				: 김준형, 조민제
	 */
	@RequestMapping(value = "custJoin", method = RequestMethod.POST)
	public String custJoin(Customer customer, Model model, String birth_Year, String birth_Month, String birth_Day) throws MessagingException, UnsupportedEncodingException {
		
		String cust_Birth = birth_Year +"/"+birth_Month +"/"+birth_Day +"/";
		
		customer.setCust_Birth(cust_Birth);
		
		logger.info("회원가입중");
		// boolean joinIs = custDao.insertCustomer(customer)

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
			messageHelper
					.setText( // 메일 내용
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
	
	
	/*
	 * @comment			: 인증 받은 회원의 EmailVerify 속성을 'Y'로 변경한다.
	 * @param	userid	: E-mail 인증을 받은 회원의 ID
	 * @author			: 김준형
	 */
	@RequestMapping(value = "verify", method = RequestMethod.GET)
	public String verifySuccess(@RequestParam String cust_Email) {
		
		logger.info("E-mail Verify");
		logger.info(cust_Email);
		
		boolean verifyIs = custDao.verifyUser(cust_Email);

		if(verifyIs) {
			
			logger.info("E-mail Verify Success");
		}
		else {
			
			logger.info("E-mail Verify Fail");
		}
		
		return "redirect:/";
	}
	
	/* 
	 * @comment				: 회원 로그인 처리
	 * @param	loginInfo	: View에서 입력받은 User ID와 User Pw를 저장하고 있는 객체
	 * 			session		: 로그인 성공 시 User ID를 저장
	 * 			model		: 로그인 실패 시 실패 메시지를 User에게 알리기 위한 메시지 저장
	 * @author				: 김준형
	 */
	/*@RequestMapping(value="login", method=RequestMethod.POST)
	public String userLogin(UserInfoVO loginInfo, HttpSession session, Model model) {
		
		logger.info("User Loing Start");	
		
		// View에서 입력받은 ID와 PW를 각각 HashMap에 저장
		HashMap<String, Object> userAccount = new HashMap<>();
		userAccount.put("userid", loginInfo.getUserid());
		userAccount.put("userpw", loginInfo.getUserpw());
		
		// DAO를 통해 받은 User의 정보를 user 객체에 저장
		UserInfoVO user = userDao.selectUser(userAccount);
		int userVerified = (user != null) ? user.getEmailverify() : 'N';	// E-mail 인증 여부
		
		// E-mail 인증까지 모두 마친 로그인
		if(user != null && userVerified == 'Y') {
			
			logger.info("User Login Success");
			
			session.setAttribute("userid", user.getUserid());	// 로그인 성공시 User ID를 Session에 저장
			session.setAttribute("username", user.getUsername()); 
		}
		
		// E-mail 인증이 되지 않은 로그인
		else if(user != null && userVerified == 'Y') {
			
			logger.info("User Login Fail - Email Verify Fail");
			
//			model.addAttribute("notVerify", "true");
		}
		else {
			
			logger.info("User Login Fail");
		}
		
		return "redirect:/";
	}*/

}
