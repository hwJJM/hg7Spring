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
	
	@Autowired HttpSession session;
	@Autowired MService mservice;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	@GetMapping("/login")
	public String login() {
		System.out.println("get방식");
		return "login";
	}
	@PostMapping("/login")
	public String dologin(Member member, Model model) {
		//로그인 화면에서 넘어온 정보 출력해보기
		System.out.println("post방식");
		System.out.println("id : "+member.getId());
		System.out.println("pw : "+member.getPw());
		
		Member mem = mservice.selectLogin(member.getId(), member.getPw());
		if(mem != null) {
			session.setAttribute("sessionId", mem.getId());
			session.setAttribute("sessionName", mem.getName());
			model.addAttribute("loginCk",1);
		}else {
			model.addAttribute("loginCk",0);
		}
		return "login";
	}
	@RequestMapping("/logout")
	public String logout() {
		session.invalidate();
		return "redirect:/"; //
	}
}
