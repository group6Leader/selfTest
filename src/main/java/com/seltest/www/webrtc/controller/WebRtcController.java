package com.seltest.www.webrtc.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping(value = "webrtc")
public class WebRtcController {

	
	private static final Logger logger = LoggerFactory.getLogger(WebRtcController.class);

	@RequestMapping(value = "goWebRtc1", method = RequestMethod.GET)
	public String goWebRtc1() {

		logger.info("webRtc-1 창으로 이동합니다-c");

		return "webrtc/webRtc-1";

	}
}
