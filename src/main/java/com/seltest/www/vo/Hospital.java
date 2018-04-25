package com.seltest.www.vo;

public class Hospital {

	String yadmNm;		//병원 이름
    String addr;				//병원 주소
    String hospUrl;			//병원 홈페이지
    String telno;				//병원 전화번호
    String xPos;				//병원 x좌표
    String yPos;				//병원 y좌표
    int numOfRows;			//한 페이지 결과 수
    String sidoCd;					//시도 코드
    String clCd;				//종별 코드
    String dgsbjtCd;			//진료 과목 코드
	String radius;					//반경
    String sgguCdNm;		//시군구코드
    
    public Hospital() {
		super();
	}   

	public Hospital(String yadmNm, String addr, String hospUrl, String telno, String xPos, String yPos, int numOfRows,
			String sidoCd, String clCd, String dgsbjtCd, String radius, String sgguCdNm) {
		super();
		this.yadmNm = yadmNm;
		this.addr = addr;
		this.hospUrl = hospUrl;
		this.telno = telno;
		this.xPos = xPos;
		this.yPos = yPos;
		this.numOfRows = numOfRows;
		this.sidoCd = sidoCd;
		this.clCd = clCd;
		this.dgsbjtCd = dgsbjtCd;
		this.radius = radius;
		this.sgguCdNm = sgguCdNm;
	}

	public String getYadmNm() {
		return yadmNm;
	}

	public void setYadmNm(String yadmNm) {
		this.yadmNm = yadmNm;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getHospUrl() {
		return hospUrl;
	}

	public void setHospUrl(String hospUrl) {
		this.hospUrl = hospUrl;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getxPos() {
		return xPos;
	}

	public void setxPos(String xPos) {
		this.xPos = xPos;
	}

	public String getyPos() {
		return yPos;
	}

	public void setyPos(String yPos) {
		this.yPos = yPos;
	}

	public int getNumOfRows() {
		return numOfRows;
	}

	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}

	public String getSidoCd() {
		return sidoCd;
	}

	public void setSidoCd(String sidoCd) {
		this.sidoCd = sidoCd;
	}

	public String getClCd() {
		return clCd;
	}

	public void setClCd(String clCd) {
		this.clCd = clCd;
	}

	public String getDgsbjtCd() {
		return dgsbjtCd;
	}

	public void setDgsbjtCd(String dgsbjtCd) {
		this.dgsbjtCd = dgsbjtCd;
	}

	public String getRadius() {
		return radius;
	}

	public void setRadius(String radius) {
		this.radius = radius;
	}

	
	
	public String getSgguCdNm() {
		return sgguCdNm;
	}

	public void setSgguCdNm(String sgguCdNm) {
		this.sgguCdNm = sgguCdNm;
	}

	@Override
	public String toString() {
		return "Hospital [yadmNm=" + yadmNm + ", addr=" + addr + ", hospUrl=" + hospUrl + ", telno=" + telno + ", xPos="
				+ xPos + ", yPos=" + yPos + ", sgguCdNm=" + sgguCdNm + "]";
	}

	
	
}
