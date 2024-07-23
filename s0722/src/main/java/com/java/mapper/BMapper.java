package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Board;

@Mapper
public interface BMapper {

	ArrayList<Board> selectAll(int startRow, int endRow, String category, String s_word);

	Board selectOne(int bno);

	int selectListCount(String category, String s_word);

	void insertOne(Board board);

	void insertReplyOne(Board board);

	void updateBSteoCount(Board board);

	Board selectPrev(int bno);

	Board selectNext(int bno);

}
