package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.Board;

public interface BoardMapper {

	int insertBoard(Board board);
	
	ArrayList<Board> bList();
	
	Board readOne(int board_Num);
	
	void hits(int board_Num);
	
	void delete(int board_Num);
	
	void update(Board board);
	
}
