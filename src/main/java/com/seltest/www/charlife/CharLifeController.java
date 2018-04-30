package com.seltest.www.charlife;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.seltest.www.common.PageNavigator;
import com.seltest.www.dao.BoardDAO;
import com.seltest.www.dao.ReplyDAO;
import com.seltest.www.vo.Board;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Reply;


@Controller
@RequestMapping(value = "charlife")
public class CharLifeController {

	private static final Logger logger = LoggerFactory.getLogger(CharLifeController.class);

	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	ReplyDAO replyDAO;
	
	final int countPerPage = 5;
	final int pagePerGroup = 5;
	
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
	
	/*@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(Model model) {
		
		logger.info("boardList로 이동");
		
		ArrayList<Board> bList = boardDAO.bList();
		
		for (int i = 0; i < bList.size(); i++) {
			System.out.println(bList);
		}
		
		model.addAttribute("bList", bList);
		
		return "charlife/board/list";
	}*/
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeForm() {
		
		logger.info("writeForm로 이동");
		
		
		return "charlife/board/writeForm";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeResult(Board board, HttpSession session) {
		
		logger.info("write 완료");	
		logger.info("{}", board);
		
		Customer customer = (Customer)session.getAttribute("customer");
		int cust_Num = customer.getCust_Num();
		
		board.setCust_Num(cust_Num);
		int insert = boardDAO.insertBoard(board);
		logger.info("insert: " + insert);
		
		return "redirect: ./boardList";
	}
	
	@RequestMapping(value = "readOne", method = RequestMethod.GET)
	public String readOne(int board_Num, Model model) {
		
		boardDAO.hits(board_Num);
		logger.info("readOne으로 이동");
		
		Board board = boardDAO.readOne(board_Num);
		logger.info("{}", board);
		
		ArrayList<Reply> rList = replyDAO.rList(board_Num);
		/*for (int i = 0; i < rList.size(); i++) {
			System.out.println(rList);
		}*/
		
		model.addAttribute("b", board);
		model.addAttribute("rList", rList);
		
		return "charlife/board/readOne";
	}
	
	/*@RequestMapping(value = "write", method = RequestMethod.POST)
	public String writeResult(Board board) {
		
		logger.info("writeResult로 이동");	
		logger.info("{}", board);
		
		int insert = boardDAO.insertBoard(board);
		logger.info("insert: " + insert);
		
		return "redirect: ./boardList";
	}*/
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int board_Num) {
		
		boardDAO.delete(board_Num);
		logger.info("delete으로 이동");
		
		return "redirect: ./boardList";
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.GET)
	public String editForm(int board_Num, Model model) {

		logger.info("editForm으로 이동");
		
		Board board = boardDAO.readOne(board_Num);
		logger.info("{}", board);
		
		model.addAttribute("b", board);
		
		return "charlife/board/editForm";
	}
	
	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String editResult(Board board) {

		logger.info("BoardEditResult으로 이동");
		logger.info("{}", board);
		
		boardDAO.update(board);
		
		return "redirect: ./boardList";
	}
	
	
	@RequestMapping(value="boardList" , method = RequestMethod.GET)
	public String goBoard(Model model, HttpSession session 
			,@RequestParam(value = "page",defaultValue = "1")int page
			,@RequestParam(value = "searchText",defaultValue="")String searchText
			,@RequestParam(value = "searchSelect",defaultValue="title")String searchSelect
			){
		
		logger.info("글 목록 이동 시작-c");
		
		
		HashMap<String , Object> hMap = new HashMap<>();
		
		hMap.put("searchSelect", searchSelect);
		hMap.put("searchText", searchText);
		
		
		int total = boardDAO.getTotal(hMap);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		ArrayList<Board> bList = boardDAO.bList();
		
		bList = boardDAO.selectBoardList(hMap, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("bList", bList);
		model.addAttribute("searchText", searchText);
		model.addAttribute("searchSelect", searchSelect);
		model.addAttribute("navi", navi);
		session.setAttribute("cur", navi.getCurrentPage());
		
		
		return "charlife/board/list";
	}
	
}
