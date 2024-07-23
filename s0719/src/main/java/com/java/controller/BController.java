package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Board;
import com.java.service.BService;

@Controller
@RequestMapping("/board")
public class BController {
	@Autowired BService bservice;
	@RequestMapping("/blist")
	public String blist(@RequestParam(defaultValue = "1") int page, Model model) { 
				//@RequestParam(defaultValue = "1") page값이 아무것도 안들어오면 1을 넣겠다
		HashMap<String, Object> map = bservice.selectAll(page);
		//확인용
		//System.out.println(list.get(0).getId());
		//model.addAttribute("list",list);
		model.addAttribute("list",map.get("list"));
		model.addAttribute("listCount",map.get("listCount"));
		model.addAttribute("maxPage",map.get("maxPage"));
		model.addAttribute("startPage",map.get("startPage"));
		model.addAttribute("endPage",map.get("endPage"));
		model.addAttribute("startRow",map.get("startRow"));
		model.addAttribute("endRow",map.get("endRow"));
		model.addAttribute("page",map.get("page"));
		System.out.println("maxPage : "+map.get("maxPage"));
		
		return "board/blist";
	}
	@RequestMapping("/bread")
	public String bread(int bno, Model model) {
		//System.out.println(bno);
		Board board = bservice.selectOne(bno);
		//확인용
		System.out.println(board.getBtitle());
		model.addAttribute("board",board);
		return "board/bread";
	}
	@GetMapping("/bwrite")
	public String bwrite() {
		return "board/bwrite";
	}
	@PostMapping("/bwrite")
	public String dobwrite(Board board, @RequestPart MultipartFile file) {
		String fileName ="";
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();// 실제파일이름
			UUID uuid = UUID.randomUUID();// 랜덤숫자생성
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
			}catch(Exception e) {e.printStackTrace();}
		}
		board.setBfile(fileName); // board객체에 file이름저장
		//System.out.println(board.getBfile()); 확인용
		bservice.insertOne(board);
		return "redirect:blist";
	}
	@RequestMapping("/bdelete")
	public String bdelete(int bno) {
		System.out.println("delete : "+bno);
		bservice.deleteOne(bno);
		return "redirect:blist";
	}
	@GetMapping("/bmodi")
	public String bmodi(int bno, Model model) {
		//System.out.println("bmodi : "+bno); 확인
		Board board = bservice.selectOne(bno);
		model.addAttribute("board",board);
		return "board/bmodi";
	}
	@PostMapping("/bmodi")
	public String dobmodi(Board board, @RequestPart MultipartFile file) {
		String fileName ="";
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();// 실제파일이름
			UUID uuid = UUID.randomUUID();// 랜덤숫자생성
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
			}catch(Exception e) {e.printStackTrace();}
			board.setBfile(fileName); // board객체에 file이름저장
		}
		//System.out.println(board.getBfile()); 확인용
		bservice.updateOne(board);
		return "redirect:blist";
	}
	@GetMapping("/breply")
	public String breply(int bno, Model model) {
		//System.out.println("breply : "+bno); 
		Board board = bservice.selectOne(bno);
		model.addAttribute("board",board);
		return "board/breply";
	}
	@PostMapping("/breply")
	public String dobreply(Board board, @RequestPart MultipartFile file) {
//		System.out.println("bno"+board.getBno());
//		System.out.println("bgroup"+board.getBgroup());
//		System.out.println("bindent"+board.getBindent());
//		System.out.println("bstep"+board.getBstep());  확인
		String fileName ="";
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();// 실제파일이름
			UUID uuid = UUID.randomUUID();// 랜덤숫자생성
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
			}catch(Exception e) {e.printStackTrace();}
			board.setBfile(fileName); // board객체에 file이름저장
		}
		//System.out.println(board.getBfile()); 확인용
		bservice.replyOne(board);
		return "redirect:blist";
	}
	
}
