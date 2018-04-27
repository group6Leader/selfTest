package com.seltest.www.vo;

public class Reply {

	private int reply_Num;
	private int board_Num;
	private int cust_Num;
	private String text;
	private String inputDate;
	
	public Reply(int reply_Num, int board_Num, int cust_Num, String text, String inputDate) {
		this.reply_Num = reply_Num;
		this.board_Num = board_Num;
		this.cust_Num = cust_Num;
		this.text = text;
		this.inputDate = inputDate;
	}
	
	public Reply() {
	}

	public int getReply_Num() {
		return reply_Num;
	}

	public void setReply_Num(int reply_Num) {
		this.reply_Num = reply_Num;
	}

	public int getBoard_Num() {
		return board_Num;
	}

	public void setBoard_Num(int board_Num) {
		this.board_Num = board_Num;
	}

	public int getCust_Num() {
		return cust_Num;
	}

	public void setCust_Num(int cust_Num) {
		this.cust_Num = cust_Num;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	@Override
	public String toString() {
		return "Reply [reply_Num=" + reply_Num + ", board_Num=" + board_Num + ", cust_Num=" + cust_Num + ", text="
				+ text + ", inputDate=" + inputDate + "]";
	}
	
	/*create table reply (
		reply_Num		number				primary key
		, board_Num		number				
		, cust_Num      number		
		, text			varchar2(100)		
		, inputDate		date				default sysdate
	);*/

}
