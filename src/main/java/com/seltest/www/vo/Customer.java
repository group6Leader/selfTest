package com.seltest.www.vo;

import java.io.Serializable;

public class Customer implements Serializable{

	private int cust_Num;
	private String cust_Id;
	private String cust_Name;
	private String cust_Pw;
	private String cust_Sex;
	private String cust_Birth;
	private String cust_Address;
	private String cust_Phone;
	private String cust_Email;
	private String cust_Major;
	private String original_File;
	private String saved_File;
	private char EmailVerify;
	private int division;
	
	public Customer(int cust_Num, String cust_Id, String cust_Name, String cust_Pw, String cust_Sex, String cust_Birth,
			String cust_Address, String cust_Phone, String cust_Email, String cust_Major, String original_File,
			String saved_File, char emailVerify, int division) {
		this.cust_Num = cust_Num;
		this.cust_Id = cust_Id;
		this.cust_Name = cust_Name;
		this.cust_Pw = cust_Pw;
		this.cust_Sex = cust_Sex;
		this.cust_Birth = cust_Birth;
		this.cust_Address = cust_Address;
		this.cust_Phone = cust_Phone;
		this.cust_Email = cust_Email;
		this.cust_Major = cust_Major;
		this.original_File = original_File;
		this.saved_File = saved_File;
		EmailVerify = emailVerify;
		this.division = division;
	}

	public Customer() {
		super();
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

	public String getCust_Pw() {
		return cust_Pw;
	}

	public void setCust_Pw(String cust_Pw) {
		this.cust_Pw = cust_Pw;
	}

	public String getCust_Sex() {
		return cust_Sex;
	}

	public void setCust_Sex(String cust_Sex) {
		this.cust_Sex = cust_Sex;
	}

	public String getCust_Birth() {
		return cust_Birth;
	}

	public void setCust_Birth(String cust_Birth) {
		this.cust_Birth = cust_Birth;
	}

	public String getCust_Address() {
		return cust_Address;
	}

	public void setCust_Address(String cust_Address) {
		this.cust_Address = cust_Address;
	}

	public String getCust_Phone() {
		return cust_Phone;
	}

	public void setCust_Phone(String cust_Phone) {
		this.cust_Phone = cust_Phone;
	}

	public String getCust_Email() {
		return cust_Email;
	}

	public void setCust_Email(String cust_Email) {
		this.cust_Email = cust_Email;
	}

	public String getCust_Major() {
		return cust_Major;
	}

	public void setCust_Major(String cust_Major) {
		this.cust_Major = cust_Major;
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

	public char getEmailVerify() {
		return EmailVerify;
	}

	public void setEmailVerify(char emailVerify) {
		EmailVerify = emailVerify;
	}

	public int getDivision() {
		return division;
	}

	public void setDivision(int division) {
		this.division = division;
	}

	@Override
	public String toString() {
		return "Customer [cust_Num=" + cust_Num + ", cust_Id=" + cust_Id + ", cust_Name=" + cust_Name + ", cust_Pw="
				+ cust_Pw + ", cust_Sex=" + cust_Sex + ", cust_Birth=" + cust_Birth + ", cust_Address=" + cust_Address
				+ ", cust_Phone=" + cust_Phone + ", cust_Email=" + cust_Email + ", cust_Major=" + cust_Major
				+ ", original_File=" + original_File + ", saved_File=" + saved_File + ", EmailVerify=" + EmailVerify
				+ ", division=" + division + "]";
	}
}
