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

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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



@Controller
@RequestMapping(value = "webrtc")
public class WebRtcController {

	
	private static final Logger logger = LoggerFactory.getLogger(WebRtcController.class);


	@RequestMapping(value = "goWebRtc", method = RequestMethod.GET)
	public String goWebRtc4() {

		logger.info("webRtc-4 창으로 이동합니다-c");

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


