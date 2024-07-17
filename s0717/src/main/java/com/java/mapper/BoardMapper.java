package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Board;

@Mapper
public interface BoardMapper {
	//게시글 전체가져오기
	ArrayList<Board> selectBoardAll();
//게시글 한개 가져오기
	Board selectBoardOne(int bno);
//게시글 한개 넣기
	void insertOne(Board board);
//게시글 한개 수정하기
	void updateOne(Board board);
//게시글 한개 삭제하기
	void deleteOne(int bno);
//조회수 올리기
	void updateBhitUp(int bno);

}
