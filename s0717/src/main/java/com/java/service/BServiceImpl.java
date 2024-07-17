package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Board;
import com.java.mapper.BoardMapper;

@Service
public class BServiceImpl implements BService{
	@Autowired
	BoardMapper bMapper;
	@Override
	public ArrayList<Board> selectBoardAll() {
		ArrayList<Board> list = bMapper.selectBoardAll();
		return list;
	}
	@Override
	public Board selectBoardOne(int bno) {
		Board board = bMapper.selectBoardOne(bno);
		return board;
	}
	@Override
	public void insertOne(Board board) {
		bMapper.insertOne(board);
		
	}
	@Override
	public void updateOne(Board board) {
		bMapper.updateOne(board);
		
	}
	@Override
	public void deleteOne(int bno) {
		bMapper.deleteOne(bno);
		
	}
	@Override
	public void updateBhitUp(int bno) {
		bMapper.updateBhitUp(bno);
	}

}
