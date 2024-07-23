package com.java.service;

import java.util.HashMap;

public interface BService {

	HashMap<String, Object> selectAll(int page, String category, String s_word);

	HashMap<String, Object> selectOne(int bno, String s_word, String category);

}
