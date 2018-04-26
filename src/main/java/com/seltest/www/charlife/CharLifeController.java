package com.seltest.www.charlife;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.vo.Board;


@Controller
@RequestMapping(value = "charlife")
public class CharLifeController {


	private static final Logger logger = LoggerFactory.getLogger(CharLifeController.class);

	@RequestMapping(value = "gocharlife", method = RequestMethod.GET)
	public String gocharlife() {
		logger.info("charlife로 이동합니다-c");

		return "charlife/charlifehome";	
	}
	
	@RequestMapping(value = "gocontent", method = RequestMethod.GET)
	public String gocharlifeContent() {
		logger.info("charlifecontent로 이동합니다-c");

		return "charlife/magazine/charlifeContent";
	}
	
	@RequestMapping(value = "gocontent2", method = RequestMethod.GET)
	public String gocharlifeContent2() {
		logger.info("charlifecontent2로 이동합니다-c");

		return "charlife/magazine/charlifeContent2";
	}
	
	@RequestMapping(value = "gocontent3", method = RequestMethod.GET)
	public String gocharlifeContent3() {
		logger.info("charlifecontent3로 이동합니다-c");

		return "charlife/magazine/charlifeContent3";
	}

	@RequestMapping(value = "gocontent4", method = RequestMethod.GET)
	public String gocharlifeContent4() {
		logger.info("charlifecontent4로 이동합니다-c");

		return "charlife/magazine/charlifeContent4";
	}
	
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList() {
		
		logger.info("boardList로 이동");
		
		
		return "charlife/board/list";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm() {
		
		logger.info("writeForm로 이동");
		
		
		return "charlife/board/writeForm";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeResult(Board board) {
		
		logger.info("writeResult로 이동");
		
		
		return "redirect: ./";
	}
	
}
