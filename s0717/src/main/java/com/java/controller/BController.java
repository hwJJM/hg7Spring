package com.java.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.Board;
import com.java.service.BService;

@Controller
@RequestMapping("/board")
public class BController {
	@Autowired
	BService bService;
	
	@RequestMapping("/bdelete")
	public String bdelete(int bno) {
		System.out.println("bdelete bno : "+bno);
		bService.deleteOne(bno);
		return "redirect:blist";
	}
	@RequestMapping("/blist")
	public String blist(Model model) {
		ArrayList<Board> list = bService.selectBoardAll();
		//확인용
		System.out.println(list.get(0).getBtitle());
		
		//model
		model.addAttribute("list",list);
		
		return "board/blist";
	}
	@RequestMapping("/bview")
	public String bview(int bno, Model model) {
		System.out.println("bno : "+bno);
		Board board = bService.selectBoardOne(bno);
		
		bService.updateBhitUp(bno);
		//확인용
		System.out.println(board.getBtitle());
		//model
		model.addAttribute("board", board);
		return "board/bview";
	}
	@GetMapping("/bwrite")
	//글쓰기 화면 출력
	public String bwrite() {
		System.out.println("Get방식으로 들어옵니다");
		return "board/bwrite";
	}
	@PostMapping("/bwrite")
	//글쓰기 화면에서 저장버튼 눌렀을 때
	public String dobwrite(Board board, Model model, @RequestPart MultipartFile file) {
		System.out.println("Post방식으로 들어옵니다");
		String fileName="";
		//파일이 있을 경우 파일 저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();//실제파일이름
			UUID uuid = UUID.randomUUID(); //랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; //파일 이름 변경(중복방지)
			System.out.println(fileName);
			String uploadUrl = "c:/upload/"; //파일 업로드위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); //파일저장
			}catch(Exception e) {e.printStackTrace();}
		}
		board.setBfile(fileName);
//		System.out.println("bwrite - fileName : "+board.getBfile());
		bService.insertOne(board);
		
		return "redirect:blist";
	}
	
	//글쓰기 수정 눌렀을 때 기본정보 채워진 화면 표출
	@GetMapping("/bmodi")
	public String bmodi(int bno, Model model) {
		System.out.println("get으로 게시글 수정");
		System.out.println(bno);
		Board board = bService.selectBoardOne(bno);
		model.addAttribute("board",board);
		return "board/bmodi";
	}
	//수정 후 수정 완료 버튼을 눌렀을 때
	@PostMapping("/bmodi")
	public String doBmodi(Board board, Model model, @RequestPart MultipartFile file) {
		System.out.println("Post로 게시글 수정");
		String fileName="";
		//파일이 있을 경우 > 기존파일 대신 새로운 파일을 선택했을 때
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();//실제파일이름
			UUID uuid = UUID.randomUUID(); //랜덤숫자 생성
			fileName = uuid+"_"+ori_fileName; //파일 이름 변경(중복방지)
			System.out.println(fileName);
			String uploadUrl = "c:/upload/"; //파일 업로드위치
			File f = new File(uploadUrl+fileName);
			try {
				file.transferTo(f); //파일저장
				board.setBfile(fileName);
			}catch(Exception e) {e.printStackTrace();}
		}
		bService.updateOne(board);
		return "redirect:blist";
	}
}
