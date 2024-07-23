package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.Board;

public interface BService {

	HashMap<String, Object> selectAll(int page);

	Board selectOne(int bno);

	void insertOne(Board board);

	void deleteOne(int bno);

	void updateOne(Board board);

	void replyOne(Board board);

	

}
