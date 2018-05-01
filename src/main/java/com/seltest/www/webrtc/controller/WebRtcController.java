package com.seltest.www.webrtc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.annotation.Resource;
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
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.seltest.www.common.MediaUtils;
import com.seltest.www.common.UploadFileUtils;
import com.seltest.www.dao.ReservationDAO;
import com.seltest.www.vo.Member;
import com.seltest.www.vo.Reservation;



@Controller
@RequestMapping(value = "webrtc")
public class WebRtcController {

	@Autowired
	ReservationDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(WebRtcController.class);


	@RequestMapping(value = "goWebRtc", method = RequestMethod.GET)
	public String goWebRtc4(HttpSession session) {
		
		logger.info("webRtc-4 창으로 이동합니다-c");

		int cust_Num = 0;
		Member member = (Member) session.getAttribute("member");
		if(member != null){
			cust_Num = member.getCustomer().getCust_Num();
		}
				
		Reservation myRes = new Reservation();
		int result = 0;		
		
		//로그인 체크
		if(member != null){				
			myRes = dao.selectMyReservation(cust_Num);
			//나의 예약정보 확인
			if(myRes != null){
				cust_Num = myRes.getCust_Num();
				int res_Num = myRes.getRes_Num();
				Reservation res = new Reservation();
				res.setCust_Num(cust_Num);
				res.setRes_Num(res_Num);
				result = dao.deleteReservation(res);
				if(result != 0){
					System.out.println("예약 삭제 성공");
					session.removeAttribute("myReservation");
				}else{
					System.out.println("예약 삭제 실패");
					return "../";
				}
			}
		}
		
		
		return "webrtc/webRtc";

	} 
	@Resource(name="uploadPath")
    String uploadPath;
	
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


