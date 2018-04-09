package com.seltest.www.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "chat")
public class ChatController {

	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@RequestMapping(value = "goChat", method = RequestMethod.GET)
	public String goChat() {

		logger.info("회원가입 창으로 이동합니다-c");

		return "chat/chat-sockjs";

	}
	
}
