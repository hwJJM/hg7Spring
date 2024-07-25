package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.Comment;

public interface BService {

	HashMap<String, Object> selectAll(int page, String category, String s_word);

	HashMap<String, Object> selectOne(int bno, String s_word, String category);

	ArrayList<Comment> selectComAll(int bno);

	Comment commentInsert(Comment comdto);

	void commentDelete(int cno);

	Comment commentUpdate(Comment cdto);

}
