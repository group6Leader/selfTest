package com.seltest.www.charlife;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "charlife")
public class CharLifeController {


	private static final Logger logger = LoggerFactory.getLogger(CharLifeController.class);

	@RequestMapping(value = "gocharlife", method = RequestMethod.GET)
	public String gocharlife() {
		logger.info("charlife로 이동합니다-c");

		return "charlife/charlife";

	
	}
	@RequestMapping(value = "gocontent", method = RequestMethod.GET)
	public String gocharlifeContent() {
		logger.info("charlifecontent로 이동합니다-c");

		return "charlife/charlifeContent";

	
	}
}
