package com.seltest.www.vo;

public class Find {

	private String hos_Name;
	private String hos_Address;
	private String hos_Phone;
	private String findName;

	public Find() {
	}

	public Find(String hos_Name, String hos_Address, String hos_Phone, String findName) {
		this.hos_Name = hos_Name;
		this.hos_Address = hos_Address;
		this.hos_Phone = hos_Phone;
		this.findName = findName;
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

	public String getFindName() {
		return findName;
	}

	public void setFindName(String findName) {
		this.findName = findName;
	}

	@Override
	public String toString() {
		return "Find [hos_Name=" + hos_Name + ", hos_Address=" + hos_Address + ", hos_Phone=" + hos_Phone
				+ ", findName=" + findName + "]";
	}

}
