package com.seltest.www.vo;

public class HealthRecord {

	private int dia_Num;
	private String dis_Name;
	private String final_Diagnosis;
	private String dis_Category;
	private String first_Date;
	private String dia_Date;
	private String care_Opinions;
	private String ect;
	private String usage;
	private String issue_Date;
	private String hos_Name;
	private String hos_Address;
	private String hos_Phone;
	private int cust_Num;
	private int dia_del;
	private String cust_Id;

	public HealthRecord(int dia_Num, String dis_Name, String final_Diagnosis, String dis_Category, String first_Date,
			String dia_Date, String care_Opinions, String ect, String usage, String issue_Date, String hos_Name,
			String hos_Address, String hos_Phone, int cust_Num, int dia_del, String cust_Id) {
		this.dia_Num = dia_Num;
		this.dis_Name = dis_Name;
		this.final_Diagnosis = final_Diagnosis;
		this.dis_Category = dis_Category;
		this.first_Date = first_Date;
		this.dia_Date = dia_Date;
		this.care_Opinions = care_Opinions;
		this.ect = ect;
		this.usage = usage;
		this.issue_Date = issue_Date;
		this.hos_Name = hos_Name;
		this.hos_Address = hos_Address;
		this.hos_Phone = hos_Phone;
		this.cust_Num = cust_Num;
		this.dia_del = dia_del;
		this.cust_Id = cust_Id;
	}

	public HealthRecord() {
	}

	public int getDia_Num() {
		return dia_Num;
	}

	public void setDia_Num(int dia_Num) {
		this.dia_Num = dia_Num;
	}

	public String getDis_Name() {
		return dis_Name;
	}

	public void setDis_Name(String dis_Name) {
		this.dis_Name = dis_Name;
	}

	public String getFinal_Diagnosis() {
		return final_Diagnosis;
	}

	public void setFinal_Diagnosis(String final_Diagnosis) {
		this.final_Diagnosis = final_Diagnosis;
	}

	public String getDis_Category() {
		return dis_Category;
	}

	public void setDis_Category(String dis_Category) {
		this.dis_Category = dis_Category;
	}

	public String getFirst_Date() {
		return first_Date;
	}

	public void setFirst_Date(String first_Date) {
		this.first_Date = first_Date;
	}

	public String getDia_Date() {
		return dia_Date;
	}

	public void setDia_Date(String dia_Date) {
		this.dia_Date = dia_Date;
	}

	public String getCare_Opinions() {
		return care_Opinions;
	}

	public void setCare_Opinions(String care_Opinions) {
		this.care_Opinions = care_Opinions;
	}

	public String getEct() {
		return ect;
	}

	public void setEct(String ect) {
		this.ect = ect;
	}

	public String getUsage() {
		return usage;
	}

	public void setUsage(String usage) {
		this.usage = usage;
	}

	public String getIssue_Date() {
		return issue_Date;
	}

	public void setIssue_Date(String issue_Date) {
		this.issue_Date = issue_Date;
	}

	public String getHos_Name() {
		return hos_Name;
	}

	public void setHos_Name(String hos_Name) {
		this.hos_Name = hos_Name;
	}

	public String getHos_Address() {
		return hos_Address;
	}

	public void setHos_Address(String hos_Address) {
		this.hos_Address = hos_Address;
	}

	public String getHos_Phone() {
		return hos_Phone;
	}

	public void setHos_Phone(String hos_Phone) {
		this.hos_Phone = hos_Phone;
	}

	public int getCust_Num() {
		return cust_Num;
	}

	public void setCust_Num(int cust_Num) {
		this.cust_Num = cust_Num;
	}

	public int getDia_del() {
		return dia_del;
	}

	public void setDia_del(int dia_del) {
		this.dia_del = dia_del;
	}

	public String getCust_Id() {
		return cust_Id;
	}

	public void setCust_Id(String cust_Id) {
		this.cust_Id = cust_Id;
	}

	@Override
	public String toString() {
		return "HealthRecord [dia_Num=" + dia_Num + ", dis_Name=" + dis_Name + ", final_Diagnosis=" + final_Diagnosis
				+ ", dis_Category=" + dis_Category + ", first_Date=" + first_Date + ", dia_Date=" + dia_Date
				+ ", care_Opinions=" + care_Opinions + ", ect=" + ect + ", usage=" + usage + ", issue_Date="
				+ issue_Date + ", hos_Name=" + hos_Name + ", hos_Address=" + hos_Address + ", hos_Phone=" + hos_Phone
				+ ", cust_Num=" + cust_Num + ", dia_del=" + dia_del +", cust_Id"+cust_Id+"]";
	}

}
