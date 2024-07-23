package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.Member;
import com.java.service.MService;

import jakarta.servlet.http.HttpSession;

@Controller
public class FController {
	//객체생성하지 않고 사용할 수 있게해줌 Autowired
	@Autowired HttpSession session;
	@Autowired MService mservice;
	@RequestMapping("/")
	public String index() {
		return "/index";
	}
	@RequestMapping("logout")
	public String logout() {
		//세션 전체 삭제하기
		session.invalidate();
		return "redirect:/"; //index로 바로가기
	}
	@GetMapping("login")
	public String login() {
		//로그인 할 수 있는 화면 열기
		System.out.println("get");
		return "/login";
	}
	@PostMapping("login")
	public String dologin(Member member, Model model) {
	//public String dologin(String id, String pw, Model model) {
		//login.jsp에서 submit버튼을 눌렀을 때 데이터들이 전송됨
		System.out.println("post");
//		System.out.println("id:"+member.getId());
//		System.out.println("pw:"+member.getPw());
		
		Member mem = mservice.selectLogin(member.getId(), member.getPw());
		//Member mem = mservice.selectLogin(id, pw);
		if(mem != null) {
			session.setAttribute("sessionId", mem.getId());
			session.setAttribute("sessionName", mem.getName());
			model.addAttribute("loginCk",1);
		}else {
			model.addAttribute("loginCk",0);
		}
		return "login";
	}
	
}
