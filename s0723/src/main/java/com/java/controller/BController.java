package com.java.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.service.BService;

@Controller
@RequestMapping("/board")
public class BController {
	@Autowired BService bService;
	@RequestMapping("/notice")
	public String notice(String category, String s_word, Model model, @RequestParam(defaultValue="1") int page) {
		//board를 db에서 가져와 게시판에 출력하기
//		System.out.println("category-"+category);
//		System.out.println("s_word-"+s_word);
		
		
		HashMap<String, Object> map = bService.selectAll(page,category,s_word);
		//list 라는 변수는 Array를 담고있다.
		model.addAttribute("list",map.get("list"));
		
		model.addAttribute("listCount",map.get("listCount"));
		model.addAttribute("maxPage",map.get("maxPage"));
		model.addAttribute("startPage",map.get("startPage"));
		model.addAttribute("endPage",map.get("endPage"));
		model.addAttribute("startRow",map.get("startRow"));
		model.addAttribute("endRow",map.get("endRow"));
		model.addAttribute("page",map.get("page"));
		model.addAttribute("category",map.get("category"));
		model.addAttribute("s_word",map.get("s_word"));
		
		return "board/notice";
	}
	@RequestMapping("/noticeView")
	public String noticeView(Model model, int bno, @RequestParam(defaultValue="1") int page, 
			String category, String s_word ) {
		//System.out.println("bno-"+bno);
		System.out.println("category : "+category);
		System.out.println("s_word : "+s_word);
		HashMap<String, Object> map = bService.selectOne(bno,s_word,category);
		//현재게시글
		model.addAttribute("board",map.get("board"));
		//이전게시글
		model.addAttribute("prev",map.get("prev"));
		//이후게시글
		model.addAttribute("next",map.get("next"));
		
		model.addAttribute("category",category);
		model.addAttribute("s_word",s_word);
		model.addAttribute("page",page);
		
		return "board/noticeView";
	}
}
