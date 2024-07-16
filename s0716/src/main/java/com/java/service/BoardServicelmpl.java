package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Board;
import com.java.mapper.BoardMapper;

@Service
public class BoardServicelmpl implements BoardService{
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public ArrayList<Board> selectBoardAll() {
		ArrayList<Board> list = boardMapper.selectBoardAll();
		
		return list;
	}

	@Override
	public Board boradSelectOne(int bno) {
		Board board = boardMapper.boardSelectOne(bno);
		return board;
	}

}
