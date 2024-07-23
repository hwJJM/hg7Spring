package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Board;
import com.java.mapper.BMapper;

@Service
public class BServiceImpl implements BService {
	@Autowired BMapper bMapper;
	@Override
	public HashMap<String, Object> selectAll(int page) {
		HashMap<String, Object> map = new HashMap<>();
		//1. 총 게시글의 수
		int listCount = bMapper.selectListCount();
		//2. 최대페이지
		int maxPage = (int)Math.ceil(listCount/10.0);
		//3.startPage, endPage
		int startPage = (int)((page-1)/10)*10+1;
		int endPage = startPage+10-1;
		//page = 2 면 1 2 3 4 5 6 7 8 9 10
		//page = 22 면 21 22 ... 30
		//4.startRow, endRow
		int startRow = (page-1)*10+1;
		int endRow = startRow+10-1;
		
		if(endPage > maxPage) endPage=maxPage;

//		System.out.println("게시글 수 : "+listCount);
//		System.out.println("현재 페이지 : "+page);
//		System.out.println("최대 페이지 : "+maxPage);
//		System.out.println("startPage : "+startPage);
//		System.out.println("endPage : "+endPage);
//		System.out.println("startRow : "+startRow);
//		System.out.println("endRow : "+endRow);
		ArrayList<Board> list = bMapper.selectAll(startRow, endRow);
		
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
		Board board = bMapper.selectOne(bno);
		return board;
	}
	@Override
	public void insertOne(Board board) {
		bMapper.insertOne(board);
		
	}
	@Override
	public void deleteOne(int bno) {
		bMapper.deleteOne(bno);
	}
	@Override
	public void updateOne(Board board) {
		bMapper.updateOne(board);
		
	}
	@Override
	public void replyOne(Board board) {
		//1. 답글 게시글을 추가하는 부분
		bMapper.insertReplyOne(board);
		//2. bstep 조정하는 부분
		bMapper.updateBstepCount(board);
	}
	

}
