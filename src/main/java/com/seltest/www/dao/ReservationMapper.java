package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.Reservation;

public interface ReservationMapper {
	
	public int insertReservation(Reservation res);
	public ArrayList<Reservation> selectReservation();
	public ArrayList<Reservation> selectMyReservation(int cust_Num);
	public ArrayList<Reservation>checkReservation(String res_Date);
	
}
