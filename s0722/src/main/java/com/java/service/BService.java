package com.java.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.java.dto.Board;


public interface BService {

	HashMap<String, Object> selectAll(int page, String category, String s_word);

	HashMap<String, Object> selectOne(int bno);

	void insertOne(Board board);

	void replyOne(Board board);

}
