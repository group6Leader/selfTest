package com.seltest.www.vo;

public class SelfCheck {
	
	private int selfCheck_Num;
	private int blood_Pressure;
	private String smoking;
	private String drinking;
	private String diabetes;
	private String surgery;
	private String disability;
	private String medicine;
	private String allergy;
	private String overseas_Visits;
	private String sleep_Time;
	private String stress;
	private String family_History;
	private String pregnant;
	private String selfCheck_Date;
	private int cust_Num;
	
	private String pain;
	private String symptom;
	private String outbreak_Day;
	
	public SelfCheck(int selfCheck_Num, int blood_Pressure, String smoking, String drinking, String diabetes,
			String surgery, String disability, String medicine, String allergy, String overseas_Visits,
			String sleep_Time, String stress, String family_History, String pregnant, String selfCheck_Date,
			int cust_Num, String pain, String symptom, String outbreak_Day) {
		this.selfCheck_Num = selfCheck_Num;
		this.blood_Pressure = blood_Pressure;
		this.smoking = smoking;
		this.drinking = drinking;
		this.diabetes = diabetes;
		this.surgery = surgery;
		this.disability = disability;
		this.medicine = medicine;
		this.allergy = allergy;
		this.overseas_Visits = overseas_Visits;
		this.sleep_Time = sleep_Time;
		this.stress = stress;
		this.family_History = family_History;
		this.pregnant = pregnant;
		this.selfCheck_Date = selfCheck_Date;
		this.cust_Num = cust_Num;
		this.pain = pain;
		this.symptom = symptom;
		this.outbreak_Day = outbreak_Day;
	}
	
	public SelfCheck() {
		super();
	}
	
	public int getSelfCheck_Num() {
		return selfCheck_Num;
	}
	public void setSelfCheck_Num(int selfCheck_Num) {
		this.selfCheck_Num = selfCheck_Num;
	}
	public int getBlood_Pressure() {
		return blood_Pressure;
	}
	public void setBlood_Pressure(int blood_Pressure) {
		this.blood_Pressure = blood_Pressure;
	}
	public String getSmoking() {
		return smoking;
	}
	public void setSmoking(String smoking) {
		this.smoking = smoking;
	}
	public String getDrinking() {
		return drinking;
	}
	public void setDrinking(String drinking) {
		this.drinking = drinking;
	}
	public String getDiabetes() {
		return diabetes;
	}
	public void setDiabetes(String diabetes) {
		this.diabetes = diabetes;
	}
	public String getSurgery() {
		return surgery;
	}
	public void setSurgery(String surgery) {
		this.surgery = surgery;
	}
	public String getDisability() {
		return disability;
	}
	public void setDisability(String disability) {
		this.disability = disability;
	}
	public String getMedicine() {
		return medicine;
	}
	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}
	public String getAllergy() {
		return allergy;
	}
	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	public String getOverseas_Visits() {
		return overseas_Visits;
	}
	public void setOverseas_Visits(String overseas_Visits) {
		this.overseas_Visits = overseas_Visits;
	}
	public String getSleep_Time() {
		return sleep_Time;
	}
	public void setSleep_Time(String sleep_Time) {
		this.sleep_Time = sleep_Time;
	}
	public String getStress() {
		return stress;
	}
	public void setStress(String stress) {
		this.stress = stress;
	}
	public String getFamily_History() {
		return family_History;
	}
	public void setFamily_History(String family_History) {
		this.family_History = family_History;
	}
	public String getPregnant() {
		return pregnant;
	}
	public void setPregnant(String pregnant) {
		this.pregnant = pregnant;
	}
	public String getSelfCheck_Date() {
		return selfCheck_Date;
	}
	public void setSelfCheck_Date(String selfCheck_Date) {
		this.selfCheck_Date = selfCheck_Date;
	}
	public int getCust_Num() {
		return cust_Num;
	}
	public void setCust_Num(int cust_Num) {
		this.cust_Num = cust_Num;
	}
	public String getPain() {
		return pain;
	}
	public void setPain(String pain) {
		this.pain = pain;
	}
	public String getSymptom() {
		return symptom;
	}
	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}
	public String getOutbreak_Day() {
		return outbreak_Day;
	}
	public void setOutbreak_Day(String outbreak_Day) {
		this.outbreak_Day = outbreak_Day;
	}
	
	@Override
	public String toString() {
		return "SelfCheck [selfCheck_Num=" + selfCheck_Num + ", blood_Pressure=" + blood_Pressure + ", smoking="
				+ smoking + ", drinking=" + drinking + ", diabetes=" + diabetes + ", surgery=" + surgery
				+ ", disability=" + disability + ", medicine=" + medicine + ", allergy=" + allergy
				+ ", overseas_Visits=" + overseas_Visits + ", sleep_Time=" + sleep_Time + ", stress=" + stress
				+ ", family_History=" + family_History + ", pregnant=" + pregnant + ", selfCheck_Date=" + selfCheck_Date
				+ ", cust_Num=" + cust_Num + ", pain=" + pain + ", symptom=" + symptom + ", outbreak_Day="
				+ outbreak_Day + "]";
	}
}
