package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.Reservation;

public interface ReservationMapper {
	
	public int insertReservation(Reservation res);
	public ArrayList<Reservation> selectReservation(String cust_Id);	//의사 예약확인
	public Reservation selectMyReservation(int cust_Num);		//환자 본인 예약확인
	public ArrayList<Reservation>checkReservation(String res_Date);
	public int deleteMyReservation(Reservation res);
}
