package com.seltest.www.charlife;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seltest.www.dao.BoardDAO;
import com.seltest.www.dao.ReplyDAO;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Reply;

@Controller
@RequestMapping("reply")
public class ReplyController {

	public static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	ReplyDAO replyDAO;
	
	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String replyResult(Reply reply, int board_Num, HttpSession session) {
		
		logger.info("insert 하는 곳 ~ ");
		
		/*Board board = boardDAO.readOne(board_Num);*/
		
		Customer customer = (Customer)session.getAttribute("customer");
		logger.info("{}", customer);
		
		int cust_Num = customer.getCust_Num();
		reply.setCust_Num(cust_Num);
		
		replyDAO.insertReply(reply);
		
		return "redirect:../charlife/readOne?board_Num=" + board_Num;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int board_Num, int reply_Num) {
		
		logger.info("delete 하는 곳 ~ ");
		logger.info("board_Num: " + board_Num);
		logger.info("reply_Num: " + reply_Num);
		
		replyDAO.delete(reply_Num);
		
		return "redirect:../charlife/readOne?board_Num=" + board_Num;
	}

	
}
