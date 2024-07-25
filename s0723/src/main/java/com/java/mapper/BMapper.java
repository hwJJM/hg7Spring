package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Board;
import com.java.dto.Comment;

@Mapper
public interface BMapper {
//게시글 전체 가져오기
	ArrayList<Board> selectAll(int startRow, int endRow, String category, String s_word);
//bno번 게시글 가져오기
	Board selectOne(int bno);
//bno의 이전글 가져오기
	Board selectPrev(int bno, String category, String s_word);
//bno의 다음글 가져오기
	Board selectNext(int bno, String category, String s_word);
	//게시글의 수
	int selectListCount(String category, String s_word);
	//bno의 댓글 가져오기   하단댓글 전체 가져오기
	ArrayList<Comment> selectComAll(int bno);
	
	void commentInsert(Comment comdto);
	Comment selectComOne(Comment comdto);
	void commentDelete(int cno);
	void commentUpdate(Comment cdto);

}
