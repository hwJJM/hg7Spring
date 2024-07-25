package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Board;
import com.java.dto.Comment;
import com.java.mapper.BMapper;

@Service
public class BServiceImpl implements BService {
	@Autowired BMapper bMapper;
	@Override
	public HashMap<String, Object> selectAll(int page, String category, String s_word) {
		//System.out.println("page-"+page);
//		System.out.println("category-"+category);
//		System.out.println("s_word-"+s_word);
		HashMap<String, Object> map = new HashMap<>();
		//1.게시글 수
		int listCount = bMapper.selectListCount(category, s_word);
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
		System.out.println("listCount"+listCount);
		ArrayList<Board> list = bMapper.selectAll(startRow, endRow, category, s_word);
		//모든 변수를 map에 넣어서 호출한 부분을 전달
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("page", page);
		map.put("list", list);
		map.put("s_word", s_word);
		map.put("category", category);
		return map; 
	}
	@Override
	public HashMap<String, Object> selectOne(int bno, String s_word, String category ) {
		HashMap<String, Object> map = new HashMap<>();
		Board board = bMapper.selectOne(bno);
		Board prev = bMapper.selectPrev(bno,category,s_word);
		Board next = bMapper.selectNext(bno,category,s_word);
		
		map.put("board", board);
		map.put("prev", prev);
		map.put("next", next);
		//System.out.println("b-bno-"+board.getBno());
//		System.out.println("prev-bno"+prev.getBno());
//		System.out.println("next-bno"+next.getBno());
		
		return map;
	}
	
	//------------------------댓글 관련-------------------------- 
	@Override
	public ArrayList<Comment> selectComAll(int bno) {
		ArrayList<Comment> list = bMapper.selectComAll(bno);
		return list;
	}
	@Override
	public Comment commentInsert(Comment comdto) {
		System.out.println("before");
		System.out.println("bservice cno : "+comdto.getCno());
		System.out.println("bservice id : "+comdto.getId());
		System.out.println("bservice cdate : "+comdto.getCdate());
		bMapper.commentInsert(comdto);
		System.out.println("after");
		System.out.println("bservice cno : "+comdto.getCno());
		System.out.println("bservice id : "+comdto.getId());
		System.out.println("bservice cdate : "+comdto.getCdate());
		
		//하단 댓글 1개 가져오기
		Comment cdto = bMapper.selectComOne(comdto);
		
		return cdto;
	}
	@Override
	public void commentDelete(int cno) {
		bMapper.commentDelete(cno);
		
	}
	@Override
	public Comment commentUpdate(Comment cdto) {
		//하단 댓글 수정저장
		//수정내용 업데이트하기
		bMapper.commentUpdate(cdto);
		//내용가져오기
		Comment comment = bMapper.selectComOne(cdto);
		return comment;
	}

}
