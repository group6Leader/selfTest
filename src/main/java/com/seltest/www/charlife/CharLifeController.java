package com.seltest.www.charlife;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

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
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.seltest.www.common.MediaUtils;
import com.seltest.www.common.PageNavigator;
import com.seltest.www.common.UploadFileUtils;
import com.seltest.www.dao.BoardDAO;
import com.seltest.www.dao.ReplyDAO;
import com.seltest.www.vo.Board;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Customer;
import com.seltest.www.vo.Reply;


@Controller
@RequestMapping(value = "charlife")
public class CharLifeController {

	private static final Logger logger = LoggerFactory.getLogger(CharLifeController.class);

	@Resource(name="uploadPath")
    String uploadPath;
	
	Board fileboard = null;
	
	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	ReplyDAO replyDAO;
	
	
	
	final int countPerPage = 5;
	final int pagePerGroup = 5;
	
	@ResponseBody
    @RequestMapping(value="uploadboard", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
    public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		fileboard = new Board();
        
		fileboard.setOriginal_File(file.getOriginalFilename());
        String saved_File = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
        fileboard.setSaved_File(saved_File);
    	
    	System.out.println(fileboard.getOriginal_File()+"!");
    	System.out.println(fileboard.getSaved_File()+"!!");
        
    	logger.info("originalName : "+file.getOriginalFilename());
        logger.info("size : "+file.getSize());
        logger.info("contentType : "+file.getContentType());
        
        
        
        return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
    }
	
	
	
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
	public String writeResult(Board board,MultipartFile upload) {
		
		
		logger.info("writeResult로 이동");	
		logger.info("{}", board);
		
		if(fileboard != null){
			logger.info("사진 넣는중");
			board.setOriginal_File(fileboard.getOriginal_File());
			board.setSaved_File(fileboard.getSaved_File());
		
		}
		
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
	public String writeResult(Board board,HttpSession session) {
		
		logger.info("writeResult로 이동");	
		logger.info("{}", board);
		Customer customer = (Customer)session.getAttribute("customer");
		int cust_Num = customer.getCust_Num();
		
		board.setCust_Num(cust_Num);
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
	
	// 6. 이미지 표시 매핑
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping("displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
        // 서버의 파일을 다운로드하기 위한 스트림
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // 확장자를 추출하여 formatName에 저장
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // 추출한 확장자를 MediaUtils클래스에서  이미지파일여부를 검사하고 리턴받아 mType에 저장
            MediaType mType = MediaUtils.getMediaType(formatName);
            // 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
            HttpHeaders headers = new HttpHeaders();
            // InputStream 생성
            in = new FileInputStream(uploadPath + fileName);
            // 이미지 파일이면
            if (mType != null) { 
                headers.setContentType(mType);
            // 이미지가 아니면
            } else { 
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // 다운로드용 컨텐트 타입
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에  " \" 내용 \" "
                // 파일의 한글 깨짐 방지
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // 바이트배열, 헤더, HTTP상태코드
           entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP상태 코드()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //스트림 닫기
        }
        return entity;
    }

    // 7. 파일 삭제 매핑
    @ResponseBody // view가 아닌 데이터 리턴
    @RequestMapping(value = "deleteFile", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName) {
        // 파일의 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 이미지 파일 여부 검사
        MediaType mType = MediaUtils.getMediaType(formatName);
        // 이미지의 경우(썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
        // 이미지 파일이면
        if (mType != null) {
            // 썸네일 이미지 파일 추출
            String front = fileName.substring(0, 12);
            String end = fileName.substring(14);
            // 썸네일 이미지 삭제
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // 원본 파일 삭제
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

        // 데이터와 http 상태 코드 전송
        return new ResponseEntity<String>("deleted", HttpStatus.OK);
    }
    
    @RequestMapping(value = "download", method = {RequestMethod.GET,RequestMethod.POST} )
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
