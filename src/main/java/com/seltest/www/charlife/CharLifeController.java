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
	
	@RequestMapping(value = "gocontent2", method = RequestMethod.GET)
	public String gocharlifeContent2() {
		logger.info("charlifecontent2로 이동합니다-c");

		return "charlife/charlifeContent2";
	}
	
	@RequestMapping(value = "gocontent3", method = RequestMethod.GET)
	public String gocharlifeContent3() {
		logger.info("charlifecontent3로 이동합니다-c");

		return "charlife/charlifeContent3";
	}

	@RequestMapping(value = "gocontent4", method = RequestMethod.GET)
	public String gocharlifeContent4() {
		logger.info("charlifecontent4로 이동합니다-c");

		return "charlife/charlifeContent4";
	}
	
}
