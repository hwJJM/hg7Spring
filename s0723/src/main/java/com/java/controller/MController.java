package com.java.controller;

import java.util.ArrayList;

import org.apache.catalina.SessionIdGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Member;
import com.java.service.MService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MController {
	@Autowired HttpSession session;
	@Autowired MService mService;
	@PostMapping("/delMem")
	@ResponseBody   //return 값을 페이지가 아닌 데이터로 돌려준다
	public String delMem(String id) {
		mService.delMem(id);
		return "성공";
				
		
	}
	@PostMapping("/selectAll")
	@ResponseBody   //return 값을 페이지가 아닌 데이터로 돌려준다
	public ArrayList<Member> selectAll() {
		ArrayList<Member> list = mService.memberSelectAll();
		//System.out.println("member select all : "+list.get(0).getId());
		return list;
	}
	@RequestMapping("logout")
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	//------jsp 형태---------------------
	@PostMapping("/login")
	public String dologin(Member member, Model model) {
//		System.out.println("id : "+member.getId());
//		System.out.println("pw : "+member.getPw());
		//1은 성공, 0은 실패
		int result=mService.login(member);
		model.addAttribute("result", result);
		return "redirect:/";
	}
	//------ajax 형태---------------------
	@PostMapping("/ajaxLogin")
	@ResponseBody
	public String ajaxlogin(Member member) {
		System.out.println("id : "+member.getId());
		System.out.println("pw : "+member.getPw());
		//1은 성공, 0은 실패
		int result=mService.login(member);
		
		return ""+result;
	}
	@RequestMapping("/mlist")
	public String mlist() {
		session.invalidate();
		return "member/mlist";
	}
	@RequestMapping("/insertMember")
	@ResponseBody
	public Member insertMember(Member mem) {
		//System.out.println(mem.getHobbys());
		Member member = mService.insertMember(mem);
		return member;
	}
	
}
