package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.Board;
import com.java.service.BoardService;

@Controller
public class BController {
	
	@Autowired
	BoardService boardService; //보드서비스 연결
	
	
	@RequestMapping("/board/blist")
	public String blist(Model model) {
		ArrayList<Board> list = boardService.selectBoardAll();
		System.out.println(list.get(0).getBtitle());
		
		model.addAttribute("list",list);
		return "board/blist";
	}
	@RequestMapping("/board/bview")
	public String bview(int bno, Model model) {
		System.out.println("bno="+bno);
		Board board = boardService.boradSelectOne(bno);
		System.out.println(board.getBdate());
		model.addAttribute("board", board);
		return "board/bview";
	}
}
