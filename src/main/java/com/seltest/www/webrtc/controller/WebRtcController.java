package com.seltest.www.webrtc.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

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
	
    
}


