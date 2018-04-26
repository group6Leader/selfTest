package com.seltest.www.vo;

public class Prescription {

	private int pre_Num;
	private String med_Name;
	private String med_Amount;
	private String med_Count;
	private String med_Content;
	private int cust_Num;
	private int pre_Del;
	private String cust_Id; // 의사 ID 
	
	public Prescription(int pre_Num, String med_Name, String med_Amount, String med_Count, String med_Content,
			int cust_Num, int pre_Del, String cust_Id) {
		this.pre_Num = pre_Num;
		this.med_Name = med_Name;
		this.med_Amount = med_Amount;
		this.med_Count = med_Count;
		this.med_Content = med_Content;
		this.cust_Num = cust_Num;
		this.pre_Del = pre_Del;
		this.cust_Id = cust_Id;
	}

	public Prescription() {

	}

	public int getPre_Num() {
		return pre_Num;
	}

	public void setPre_Num(int pre_Num) {
		this.pre_Num = pre_Num;
	}

	public String getMed_Name() {
		return med_Name;
	}

	public void setMed_Name(String med_Name) {
		this.med_Name = med_Name;
	}

	public String getMed_Amount() {
		return med_Amount;
	}

	public void setMed_Amount(String med_Amount) {
		this.med_Amount = med_Amount;
	}

	public String getMed_Count() {
		return med_Count;
	}

	public void setMed_Count(String med_Count) {
		this.med_Count = med_Count;
	}

	public String getMed_Content() {
		return med_Content;
	}

	public void setMed_Content(String med_Content) {
		this.med_Content = med_Content;
	}

	public int getCust_Num() {
		return cust_Num;
	}

	public void setCust_Num(int cust_Num) {
		this.cust_Num = cust_Num;
	}

	public int getPre_Del() {
		return pre_Del;
	}

	public void setPre_Del(int pre_Del) {
		this.pre_Del = pre_Del;
	}
	
	public String getCust_Id() {
		return cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}

	@Override
	public String toString() {
		return "Prescription [pre_Num=" + pre_Num + ", med_Name=" + med_Name + ", med_Amount=" + med_Amount
				+ ", med_Count=" + med_Count + ", med_Content=" + med_Content + ", cust_Num=" + cust_Num + ", pre_Del="
				+ pre_Del + ", cust_Id=" + cust_Id + "]";
	}
}
