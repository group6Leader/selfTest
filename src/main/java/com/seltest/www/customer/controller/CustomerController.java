package com.seltest.www.customer.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.seltest.www.common.MediaUtils;
import com.seltest.www.common.UploadFileUtils;
import com.seltest.www.dao.CustomerDAO;
import com.seltest.www.dao.SelfCheckDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Member;
import com.seltest.www.vo.SelfCheck;

@Controller
@RequestMapping(value = "customer")
@SessionAttributes("login")
public class CustomerController {

	@Inject
	private JavaMailSender mailSender;

	@Autowired
	CustomerDAO custDao;

	@Autowired
	SelfCheckDAO selfCheckDao;

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	Customer fileCust = null;
	
	@RequestMapping(value = "goJoin", method = RequestMethod.GET)
	public String divMember() {

		logger.info("회원가입 창으로 이동합니다-c");

		return "customer/joinCustomer";

	}
	
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {

		logger.info("로그인 창으로 이동합니다-c");

		return "customer/loginForm";

	}
	
	@ResponseBody
	@RequestMapping(value = "custDel", method = RequestMethod.POST)
	public String custDel(String cust_Id, HttpSession session) {

		String msg= "!";
		
		logger.info("회원삭제중");
		
		int check = custDao.delCustomer(cust_Id);
		
		
		
		
		if(check != 0){
			msg = "delete complete";
			session.invalidate();
		}else{
			msg = "delete error";
		}
		
		
		return msg;

	}
	
	@RequestMapping(value = "goFix", method = RequestMethod.GET)
	public String goFix(Customer customer, HttpSession session,Model model ) {

		logger.info("회원수정 창으로 이동합니다-c");
		Customer loginCust = (Customer) session.getAttribute("customer");
		String loginId = loginCust.getCust_Id();
		
		Customer login = custDao.searchCustomerOne(loginId);
		
		model.addAttribute("login", login);
		
		
		return "customer/fixCustomer";

	}
	
	@ResponseBody
	@RequestMapping(value = "custFix", method = RequestMethod.POST)
	public String custFix(Customer customer) {
		
		
		String msg= "!";
		
		logger.info("회원수정 중입니다.");
	
		logger.info(customer+"!");
		
		
		Customer selCustomer = custDao.searchCustomerOne(customer.getCust_Id());
			
		Customer fixCustomer = new Customer();
		
		logger.info(selCustomer + " 수정할 회원 " );
		
		fixCustomer.setCust_Num(selCustomer.getCust_Num());
		fixCustomer.setCust_Id(selCustomer.getCust_Id());
		fixCustomer.setCust_Pw(customer.getCust_Pw());
		fixCustomer.setCust_Name(customer.getCust_Name());
		fixCustomer.setCust_Sex(selCustomer.getCust_Sex());
		fixCustomer.setCust_Birth(selCustomer.getCust_Birth());
		fixCustomer.setCust_Address(customer.getCust_Address());
		fixCustomer.setCust_Phone(customer.getCust_Phone());
		fixCustomer.setCust_Email(customer.getCust_Email());
		fixCustomer.setCust_Major(customer.getCust_Major());
		fixCustomer.setEmailVerify(selCustomer.getEmailVerify());
		fixCustomer.setDivision(selCustomer.getDivision());
		
		logger.info(fixCustomer+"수정");
		
		if(fileCust != null){
			logger.info("사진 넣는중");
			fixCustomer.setOriginal_File(fileCust.getOriginal_File());
			fixCustomer.setSaved_File(fileCust.getSaved_File());
		
		}
		
		int check = custDao.fixCustomer(fixCustomer);

		logger.info(fixCustomer+"수정!");
		if(check!=0){
			msg = "fix complete!";
			
		}else{
			msg = "fix error";
		}
		
		
		return msg;
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
	public String custJoin(Customer customer, SelfCheck selfCheck, Model model, String birth_Year, String birth_Month,
			String birth_Day, MultipartFile upload) throws MessagingException, UnsupportedEncodingException {

		logger.info("회원가입중");
		
		String cust_Birth = birth_Year + "/" + birth_Month + "/" + birth_Day;

		customer.setCust_Birth(cust_Birth);

		if(fileCust != null){
			logger.info("사진 넣는중");
			customer.setOriginal_File(fileCust.getOriginal_File());
			customer.setSaved_File(fileCust.getSaved_File());
		
		}
		

		

		
		System.out.println(customer);

		// 관리자 계정
		String admin = "pauluskim0306@gmail.com";

		// Server Address
		String serverAddress = "http://localhost:9090/www/";

		
		
		
		boolean joinIs = custDao.insertCustomer(customer);
		System.out.println(customer.getCust_Id());
		
		

		Customer c = custDao.searchCustomerOne(customer.getCust_Id());

		/* System.out.println(customer); */

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

			int cust_Num = c.getCust_Num();
			System.out.println("cust_Num: " + cust_Num);

			selfCheck.setCust_Num(c.getCust_Num());

			selfCheckDao.insertSelfCheck(selfCheck);

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
	@RequestMapping(value = "emailCheck", method = RequestMethod.POST)
	public String emailCheck(String cust_Id, String cust_Pw, Model model) {

		String message = "";
		
		System.out.println("cust_Id: " + cust_Id);
		System.out.println("cust_Pw: " + cust_Pw);
		
		Customer emailCheck = custDao.searchCustomerOne(cust_Id);
		System.out.println("emailCheck.getCust_Pw: " + emailCheck.getCust_Pw());
		
		if (emailCheck.getCust_Pw().equals(cust_Pw)) {
			if (emailCheck.getEmailVerify() == 'N') {
				message = "Email Verification Needed";
				
				/*model.addAttribute("msg", message);
				return "/";*/
				
			} else {
				message = "Login Success";
			}
		} else {
			message = "Password is Wrong";
		}
		
		return message;
	}
	
	

	@RequestMapping(value = "login_success", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session) {

		System.out.println("loginSuccess");
		
		Member member = (Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Customer selCust = custDao.searchCustomerOne(member.getCustomer().getCust_Id());
		
		logger.info("{}", selCust);
		
		session.setAttribute("member", member);
		session.setAttribute("customer", selCust);

		return "redirect:/";

	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {

		logger.info("로그아웃 시작");

		session.invalidate();

		logger.info("로그아웃 끝");

		return "redirect:/";
	}

	@Resource(name="uploadPath")
    String uploadPath;

	@RequestMapping(value="uploadForm", method=RequestMethod.POST)
    public ModelAndView uplodaForm(MultipartFile file, ModelAndView mav) throws Exception{

        logger.info("파일이름 :"+file.getOriginalFilename());
        logger.info("파일크기 : "+file.getSize());
        logger.info("컨텐트 타입 : "+file.getContentType());

        String savedName = file.getOriginalFilename();

        File target = new File(uploadPath, savedName);

        // 랜덤생성+파일이름 저장
        // 파일명 랜덤생성 메서드호출
        savedName = uploadFile(savedName, file.getBytes());
        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        // FileCopyUtils.copy(바이트배열, 파일객체)
        FileCopyUtils.copy(file.getBytes(), target);

        mav.setViewName("/upload/uploadResult");
        mav.addObject("savedName", savedName);

        return mav; // uploadResult.jsp(결과화면)로 포워딩
    }
	
	// 파일명 랜덤생성 메서드
    private String uploadFile(String originalName, byte[] fileData) throws Exception{
        // uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
        UUID uuid = UUID.randomUUID();
        // 랜덤생성+파일이름 저장
        String savedName = uuid.toString()+"_"+originalName;
        File target = new File(uploadPath, savedName);
        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        // FileCopyUtils.copy(바이트배열, 파일객체)
        FileCopyUtils.copy(fileData, target);
        return savedName;
    }
    
    @ResponseBody
    @RequestMapping(value="uploadAjax", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
        fileCust = new Customer();
        
        fileCust.setOriginal_File(file.getOriginalFilename());
        String saved_File = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
        fileCust.setSaved_File(saved_File);
    	
    	System.out.println(fileCust.getOriginal_File()+"!");
    	System.out.println(fileCust.getSaved_File()+"!!");
        
    	logger.info("originalName : "+file.getOriginalFilename());
        logger.info("size : "+file.getSize());
        logger.info("contentType : "+file.getContentType());
        
        
        
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
    }
   
 // 6. 이미지 표시 매핑
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping("displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        // 서버의 파일을 다운로드하기 위한 스트림
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // 확장자를 추출하여 formatName에 저장
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // 추출한 확장자를 MediaUtils클래스에서  이미지파일여부를 검사하고 리턴받아 mType에 저장
            MediaType mType = MediaUtils.getMediaType(formatName);
            // 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
            HttpHeaders headers = new HttpHeaders();
            // InputStream 생성
            in = new FileInputStream(uploadPath + fileName);
            // 이미지 파일이면
            if (mType != null) { 
                headers.setContentType(mType);
            // 이미지가 아니면
            } else { 
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // 다운로드용 컨텐트 타입
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에  " \" 내용 \" "
                // 파일의 한글 깨짐 방지
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // 바이트배열, 헤더, HTTP상태코드
           entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP상태 코드()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //스트림 닫기
        }
        return entity;
    }

    // 7. 파일 삭제 매핑
    @ResponseBody // view가 아닌 데이터 리턴
    @RequestMapping(value = "deleteFile", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {
        // 파일의 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 이미지 파일 여부 검사
        MediaType mType = MediaUtils.getMediaType(formatName);
        // 이미지의 경우(썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
        // 이미지 파일이면
        if (mType != null) {
            // 썸네일 이미지 파일 추출
            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            // 썸네일 이미지 삭제
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // 원본 파일 삭제
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        // 데이터와 http 상태 코드 전송
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    
    @RequestMapping(value = "download", method = RequestMethod.GET)
	public void fileDownload(HttpServletResponse response, String saved){
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(saved, "UTF-8"));
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String fullPath = uploadPath + saved;
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
