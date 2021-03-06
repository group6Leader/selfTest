package com.seltest.www.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seltest.www.vo.Board;

@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;

	
	public int insertBoard(Board board) {
		
		int result = 0;
		
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			result = mapper.insertBoard(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Board> bList() {
		
		ArrayList<Board> bList = null;
		
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			bList = mapper.bList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bList;
	}
	
	public Board readOne(int board_Num) {
		
		Board b = null;
		
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			b = mapper.readOne(board_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}
	
	public void hits(int board_Num) {
		
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			mapper.hits(board_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int board_Num) {
		
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			mapper.delete(board_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(Board board) {
		
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			mapper.update(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public ArrayList<Board> selectBoardList(HashMap<String, Object> hMap, int startRecord, int countPerPage) {

		ArrayList<Board> bList = new ArrayList<>();
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			RowBounds rb = new RowBounds(startRecord,countPerPage);
			bList = mapper.selectBoardList(hMap, rb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bList;
	}

	public int getTotal(HashMap<String, Object> hMap) {
		int total =0;
		try {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			total = mapper.getTotal(hMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return total;
	}
	
}
