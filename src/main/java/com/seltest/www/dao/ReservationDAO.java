package com.seltest.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.seltest.www.vo.Reservation;

@Repository
public class ReservationDAO {
	
	@Autowired
	SqlSession sqlSession;	

	public int insertReservation(Reservation res){		
		ReservationMapper mapper = sqlSession.getMapper(ReservationMapper.class);
		int result = 0;		
		try{
			result = mapper.insertReservation(res);				
		}catch(Exception e){
			e.printStackTrace();			
		}
		return result;		
	}
	
	public ArrayList<Reservation> selectReservation(String cust_Id){		
		ReservationMapper mapper = sqlSession.getMapper(ReservationMapper.class);		
		ArrayList<Reservation> list = new ArrayList<Reservation>();	
		try{
			list = mapper.selectReservation(cust_Id);			
		}catch(Exception e){
			e.printStackTrace();			
		}
		return list;		
	}
	
	public Reservation selectMyReservation(int cust_Num){		
		ReservationMapper mapper = sqlSession.getMapper(ReservationMapper.class);		
		Reservation myRes = new Reservation();	
		try{
			myRes = mapper.selectMyReservation(cust_Num);			
		}catch(Exception e){
			e.printStackTrace();			
		}
		return myRes;		
	}
	
	public ArrayList<Reservation>checkReservation(String res_Date){
		ReservationMapper mapper = sqlSession.getMapper(ReservationMapper.class);		
		ArrayList<Reservation> list = new ArrayList<Reservation>();	
		try{
			list = mapper.checkReservation(res_Date);			
		}catch(Exception e){
			e.printStackTrace();			
		}
		return list;		
	}
	
	public int deleteReservation(Reservation res){		
		ReservationMapper mapper = sqlSession.getMapper(ReservationMapper.class);
		int result = 0;		
		try{
			result = mapper.deleteMyReservation(res);				
		}catch(Exception e){
			e.printStackTrace();			
		}
		return result;		
	}
}
