package com.seltest.www.vo;

public class DiseaseCode {

	private String dis_Code;

	public DiseaseCode(String dis_Code) {
		this.dis_Code = dis_Code;
	}

	public DiseaseCode() {
	}

	public String getDis_Code() {
		return dis_Code;
	}

	public void setDis_Code(String dis_Code) {
		this.dis_Code = dis_Code;
	}

	@Override
	public String toString() {
		return "DiseaseCode [dis_Code=" + dis_Code + "]";
	}

}
