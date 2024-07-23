package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Board;
import com.java.mapper.BMapper;
@Service
public class BServiceImpl implements BService {
	@Autowired BMapper bmapper;
	@Override
	public HashMap<String, Object> selectAll(int page) {
		HashMap<String, Object> map = new HashMap<>();

		//1. 전체게시물 수
		int listCount = bmapper.selectListCount();
		System.out.println("게시물 수 : "+listCount);
		//최대페이지
		int maxPage = (int)Math.ceil(listCount/10.0);
		System.out.println("최대페이지"+maxPage);
		
		int startPage = (int)((page-1)/10)*10+1;
		int endPage = startPage+10-1;
		//page에 11이 넘어와야 스타트 페이지가 바뀐다.
		System.out.println("startPage:"+startPage);
		System.out.println("endPage:"+endPage);
		
		int startRow = (page-1)*10+1;
		int endRow = startRow+10-1;
		System.out.println("startRow:"+startRow);
		System.out.println("endRow:"+endRow);
		
		//내가 가진 페이지까지만 노출
		if(endPage>maxPage) endPage=maxPage;
		ArrayList<Board> list = bmapper.selectAll(startRow,endRow);
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("page", page);
		map.put("list", list);
		return map;
	}
	@Override
	public Board selectOne(int bno) {
		Board board = bmapper.selectOne(bno); 
		return board;
	}
	@Override
	public void insertOne(Board board) {
		bmapper.insertOne(board);
		
	}
	@Override
	public void updateOne(Board board) {
		bmapper.updateOne(board);
		
	}
	@Override
	public void deleteOne(int bno) {
		bmapper.deleteOne(bno);
		
	}
	@Override
	public void updateBhit(int bno) {
		bmapper.updateBhit(bno);
		
	}
	
	//답글달기
	@Override
	public void insertReplyOne(Board board) {
		//답글 게시글 추가
		bmapper.insertReplyOne(board); 
		//bstep 조정
		bmapper.updateBstepCount(board); 
		
	}

}
