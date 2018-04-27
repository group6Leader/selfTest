package com.seltest.www.vo;

public class Board {

	private int board_Num;
	private String board_Title;
	private String board_Category;
	private String content;
	private String input_Date;
	private int hits;
	private int score;
	private String original_File;
	private String saved_File;
	private int cust_Num;
	
	public Board(int board_Num, String board_Title, String board_Category, String content, String input_Date, int hits,
			int score, String original_File, String saved_File, int cust_Num) {
		this.board_Num = board_Num;
		this.board_Title = board_Title;
		this.board_Category = board_Category;
		this.content = content;
		this.input_Date = input_Date;
		this.hits = hits;
		this.score = score;
		this.original_File = original_File;
		this.saved_File = saved_File;
		this.cust_Num = cust_Num;
	}
	
	public Board() {
		super();
	}

	public int getBoard_Num() {
		return board_Num;
	}

	public void setBoard_Num(int board_Num) {
		this.board_Num = board_Num;
	}

	public String getBoard_Title() {
		return board_Title;
	}

	public void setBoard_Title(String board_Title) {
		this.board_Title = board_Title;
	}

	
	public String getBoard_Category() {
		return board_Category;
	}

	public void setBoard_Category(String board_Category) {
		this.board_Category = board_Category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getInput_Date() {
		return input_Date;
	}

	public void setInput_Date(String input_Date) {
		this.input_Date = input_Date;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getOriginal_File() {
		return original_File;
	}

	public void setOriginal_File(String original_File) {
		this.original_File = original_File;
	}

	public String getSaved_File() {
		return saved_File;
	}

	public void setSaved_File(String saved_File) {
		this.saved_File = saved_File;
	}

	public int getCust_Num() {
		return cust_Num;
	}

	public void setCust_Num(int cust_Num) {
		this.cust_Num = cust_Num;
	}

	@Override
	public String toString() {
		return "Board [board_Num=" + board_Num + ", board_Title=" + board_Title + ", board_Category=" + board_Category
				+ ", content=" + content + ", input_Date=" + input_Date + ", hits=" + hits + ", score=" + score
				+ ", original_File=" + original_File + ", saved_File=" + saved_File + ", cust_Num=" + cust_Num + "]";
	}
	
	/*BOARD_NUM     NOT NULL NUMBER        
	BOARD_TITLE   NOT NULL VARCHAR2(50)  
	HOS_NAME      NOT NULL VARCHAR2(50)  
	CONTENT       NOT NULL VARCHAR2(500) 
	INPUT_DATE             DATE          
	HITS                   NUMBER        
	SCORE                  NUMBER        
	ORIGINAL_FILE          VARCHAR2(30)  
	SAVED_FILE             VARCHAR2(30)  
	CUST_NUM      NOT NULL NUMBER*/  
}
