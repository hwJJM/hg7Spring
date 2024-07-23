package com.java.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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
	@Autowired BService bService;
	@RequestMapping("/blist")
	public String blist(@RequestParam(defaultValue="1") int page, String category, 
			String s_word, Model model) {
		//System.out.println("category : "+category);System.out.println("s_word : "+s_word);
		
		HashMap<String, Object> map = bService.selectAll(page,category,s_word);
		model.addAttribute("listCount",map.get("listCount"));
		model.addAttribute("maxPage",map.get("maxPage"));
		model.addAttribute("startPage",map.get("startPage"));
		model.addAttribute("endPage",map.get("endPage"));
		model.addAttribute("startRow",map.get("startRow"));
		model.addAttribute("endRow",map.get("endRow"));
		model.addAttribute("page",map.get("page"));
		model.addAttribute("list",map.get("list"));
		model.addAttribute("category",map.get("category"));
		model.addAttribute("s_word",map.get("s_word"));
		
//		System.out.println("page : "+map.get("page"));System.out.println("startRow : "+map.get("startRow"));System.out.println("endRow : "+map.get("endRow"));
		return "board/blist";
	}
	@RequestMapping("/bread")
	public String bread(int bno, Model model,String category, 
			String s_word, int page) {
		System.out.println("bno:"+bno);
		HashMap<String, Object> map = bService.selectOne(bno);
		model.addAttribute("board",map.get("board"));
		model.addAttribute("prev",map.get("prev"));
		model.addAttribute("next",map.get("next"));
		model.addAttribute("category",category);
		model.addAttribute("s_word",s_word);
		model.addAttribute("page",page);
		
		return "board/bread";
	}
	@GetMapping("/bwrite")
	public String bwrite() {
		return "board/bwrite";
	}
	@PostMapping("/bwrite")
	public String dobwrite(Board board, @RequestPart MultipartFile file) {
		String fileName="";
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
			}catch(Exception e) {e.printStackTrace();}
		}
		board.setBfile(fileName); // board객체에 file이름저장
		//확인용
		//System.out.println(board.getBfile()); 
		bService.insertOne(board);
		
		return "redirect:blist";
	}
	
	@GetMapping("/breply")
	public String breply(int bno, int page, String category, String s_word, Model model) {
		HashMap<String, Object> map = bService.selectOne(bno);
		model.addAttribute("board",map.get("board"));
		model.addAttribute("page",page);
		model.addAttribute("category",category);
		model.addAttribute("s_word",s_word);
		return "board/breply";
	}
	@PostMapping("/breply")
	public String dobreply(Board board, int page, String category, String s_word, 
			Model model,@RequestPart MultipartFile file) throws UnsupportedEncodingException {
//		System.out.println("bgroup"+board.getBgroup());
//		System.out.println("bindent"+board.getBindent());
//		System.out.println("bstep"+board.getBstep());  
		String fileName="";
		if(!file.isEmpty()) {
			String ori_file = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			fileName = uuid+"_"+ori_file; // 최종파일이름
			String uploadUrl = "c:/upload/"; // 파일이저장될위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f);// 파일저장
				board.setBfile(fileName); // board객체에 file이름저장
			}catch(Exception e) {e.printStackTrace();}
		}
		//확인용
		//System.out.println(board.getBfile()); 
		bService.replyOne(board);
//		model.addAttribute("page",page);
//		model.addAttribute("category",category);
//		model.addAttribute("s_word",s_word);
//		return "redirect:blist";
		s_word = URLEncoder.encode(s_word,"utf-8");
		return "redirect:blist?page="+page+"&category="+category+"&s_word="+s_word;
	}
}
