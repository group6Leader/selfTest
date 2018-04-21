package com.seltest.www.vo;

public class Hospital {

	String yadmNm;		//병원 이름
    String addr;				//병원 주소
    String hospUrl;			//병원 홈페이지
    String telno;				//병원 전화번호
    String xPos;				//병원 x좌표
    String yPos;				//병원 y좌표
    int numOfRows;			//한 페이지 결과 수
    int sidoCd;					//시도 코드
    int clCd;					//종별 코드
    int dgsbjtCd;				//진료 과목 코드
	
    public Hospital() {
		super();
	}

	public Hospital(String yadmNm, String addr, String hospUrl, String telno, String xPos, String yPos, int numOfRows,
			int sidoCd, int clCd, int dgsbjtCd) {
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

	public int getSidoCd() {
		return sidoCd;
	}

	public void setSidoCd(int sidoCd) {
		this.sidoCd = sidoCd;
	}

	public int getClCd() {
		return clCd;
	}

	public void setClCd(int clCd) {
		this.clCd = clCd;
	}

	public int getDgsbjtCd() {
		return dgsbjtCd;
	}

	public void setDgsbjtCd(int dgsbjtCd) {
		this.dgsbjtCd = dgsbjtCd;
	}

	@Override
	public String toString() {
		return "Hospital [yadmNm=" + yadmNm + ", addr=" + addr + ", hospUrl=" + hospUrl + ", telno=" + telno + ", xPos="
				+ xPos + ", yPos=" + yPos + "]";
	}      
	
}
