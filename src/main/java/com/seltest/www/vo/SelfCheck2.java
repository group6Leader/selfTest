package com.seltest.www.vo;

public class SelfCheck2 {

	private int cust_Num;
	private String cust_Id;
	private String cust_Name;
	private String cust_Birth;
	
	private int selfCheck_Num;
	private String outbreak_Day;
	
	public SelfCheck2(int cust_Num, String cust_Id, String cust_Name, String cust_Birth, int selfCheck_Num,
			String outbreak_Day) {
		
		this.cust_Num = cust_Num;
		this.cust_Id = cust_Id;
		this.cust_Name = cust_Name;
		this.cust_Birth = cust_Birth;
		this.selfCheck_Num = selfCheck_Num;
		this.outbreak_Day = outbreak_Day;
	}
	
	public SelfCheck2() {
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
	public String getCust_Name() {
		return cust_Name;
	}
	public void setCust_Name(String cust_Name) {
		this.cust_Name = cust_Name;
	}
	public String getCust_Birth() {
		return cust_Birth;
	}
	public void setCust_Birth(String cust_Birth) {
		this.cust_Birth = cust_Birth;
	}
	public int getSelfCheck_Num() {
		return selfCheck_Num;
	}
	public void setSelfCheck_Num(int selfCheck_Num) {
		this.selfCheck_Num = selfCheck_Num;
	}
	public String getOutbreak_Day() {
		return outbreak_Day;
	}
	public void setOutbreak_Day(String outbreak_Day) {
		this.outbreak_Day = outbreak_Day;
	}
	
	@Override
	public String toString() {
		return "SelfCheck2 [cust_Num=" + cust_Num + ", cust_Id=" + cust_Id + ", cust_Name=" + cust_Name
				+ ", cust_Birth=" + cust_Birth + ", selfCheck_Num=" + selfCheck_Num + ", outbreak_Day=" + outbreak_Day
				+ "]";
	}
	
}
