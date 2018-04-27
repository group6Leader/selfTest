package com.seltest.www.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.seltest.www.vo.Reply;

@Repository
public class ReplyDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertReply(Reply reply) {
		
		int result = 0;
		
		try {
			ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
			result = mapper.insertReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Reply> rList(int board_Num) {
		
		ArrayList<Reply> rList = null;
		
		try {
			ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
			rList = mapper.rList(board_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return rList;
	}
	
	public void delete(int reply_Num) {
		
		try {
			ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
			mapper.delete(reply_Num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
 	
}
