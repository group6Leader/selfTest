package com.seltest.www.dao;

import java.util.ArrayList;

import com.seltest.www.vo.Reply;

public interface ReplyMapper {

	int insertReply(Reply reply);
	
	ArrayList<Reply> rList(int board_Num);
	
	void delete(int reply_Num);
}
