package com.seltest.www.vo;

public class Reservation {
	private int res_Num;
	private String res_Date;
	private String res_Hos;
	private int cust_Num;

	public Reservation() {
		super();
	}

	public Reservation(int res_Num, String res_Date, String res_Hos, int cust_Num) {
		super();
		this.res_Num = res_Num;
		this.res_Date = res_Date;
		this.res_Hos = res_Hos;
		this.cust_Num = cust_Num;
	}

	public int getRes_Num() {
		return res_Num;
	}

	public void setRes_Num(int res_Num) {
		this.res_Num = res_Num;
	}

	public String getRes_Date() {
		return res_Date;
	}

	public void setRes_Date(String res_Date) {
		this.res_Date = res_Date;
	}

	public String getRes_Hos() {
		return res_Hos;
	}

	public void setRes_Hos(String res_Hos) {
		this.res_Hos = res_Hos;
	}

	public int getCust_Num() {
		return cust_Num;
	}

	public void setCust_Num(int cust_Num) {
		this.cust_Num = cust_Num;
	}

	@Override
	public String toString() {
		return "Reservation [res_Num=" + res_Num + ", res_Date=" + res_Date + ", res_Hos=" + res_Hos + ", cust_Num="
				+ cust_Num + "]";
	}	
}
