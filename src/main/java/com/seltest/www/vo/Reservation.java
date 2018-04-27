package com.seltest.www.vo;

public class Reservation {
	private int res_Num;
	private String res_Date;
	private String hos_Name;
	private int cust_Num;
	private String cust_Id;
	private String hos_Addr;
	private String hos_Homepage;
	private String hos_Phone;

	public Reservation() {
		super();
	}

	public Reservation(int res_Num, String res_Date, String hos_Name, int cust_Num, String cust_Id, String hos_Addr,
			String hos_Homepage, String hos_Phone) {
		super();
		this.res_Num = res_Num;
		this.res_Date = res_Date;
		this.hos_Name = hos_Name;
		this.cust_Num = cust_Num;
		this.cust_Id = cust_Id;
		this.hos_Addr = hos_Addr;
		this.hos_Homepage = hos_Homepage;
		this.hos_Phone = hos_Phone;
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

	public String getHos_Name() {
		return hos_Name;
	}

	public void setHos_Name(String hos_Name) {
		this.hos_Name = hos_Name;
	}

	public int getCust_Num() {
		return cust_Num;
	}

	public void setCust_Num(int cust_Num) {
		this.cust_Num = cust_Num;
	}

	public String getCust_Id() {
		return cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}

	public String getHos_Addr() {
		return hos_Addr;
	}

	public void setHos_Addr(String hos_Addr) {
		this.hos_Addr = hos_Addr;
	}

	public String getHos_Homepage() {
		return hos_Homepage;
	}

	public void setHos_Homepage(String hos_Homepage) {
		this.hos_Homepage = hos_Homepage;
	}

	public String getHos_Phone() {
		return hos_Phone;
	}

	public void setHos_Phone(String hos_Phone) {
		this.hos_Phone = hos_Phone;
	}

	@Override
	public String toString() {
		return "Reservation [res_Num=" + res_Num + ", res_Date=" + res_Date + ", hos_Name=" + hos_Name + ", cust_Num="
				+ cust_Num + ", cust_Id=" + cust_Id + ", hos_Addr=" + hos_Addr + ", hos_Homepage=" + hos_Homepage
				+ ", hos_Phone=" + hos_Phone + "]";
	}

}
