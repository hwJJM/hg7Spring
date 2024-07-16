package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.Member;
import com.java.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MController {
	@Autowired
	MemberService memberService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/member/memView")
	public String memView(String id, Model model ) {
		System.out.println("id = "+id);
		Member member = memberService.memberSelectOne(id);
		System.out.println("View 이름 : "+member.getName());
		model.addAttribute("member", member);
		return "member/memView";
	}
	
	
	@RequestMapping("/member/memList")
	public String memList(Model model) {
		ArrayList<Member> list = memberService.memberSelectAll();
		//확인용.
		System.out.println(list.get(0).getName());
		model.addAttribute("list",list);
		return "member/memList";
	}

	@RequestMapping("/member/login")
	public String login() {
		return "member/login";
	}
	@RequestMapping("/member/doLogin")
	public String doLogin(String id, String pw, Model model) {
		
		System.out.println("id"+id);
		System.out.println("pw"+pw);
		
		Member member = memberService.selectLogin(id,pw);
		//System.out.println("doLogin : "+member.getName());
		if(member!=null) {
			//세션에 추가
			session.setAttribute("sessionId",member.getId());
			session.setAttribute("sessionName",member.getName());
			model.addAttribute("loginCheck",1);
		}else {
			model.addAttribute("loginCheck",0);
		}
		return "member/doLogin";
	}
	@RequestMapping("/member/logout")
	public String logout(Model model) {
		//세션삭제
		session.invalidate();
		model.addAttribute("logout",1);
		return "member/logout";
	}
	@RequestMapping("/member/join")
	public String join( ) {
		return "member/join";
	}
	@RequestMapping("/member/doJoin")
	public String doJoin(Model model, Member member, String[] hobby) {
		System.out.println(member.getId()+member.getPw()+ member.getName()+member.getPhone());
		String hobbys="";
		for(int i=0;i<hobby.length;i++) {
			if(i==0) hobbys+=hobby[i];
			else hobbys += ", "+hobby[i]; 
		}
		member.setHobbys(hobbys); 
		System.out.println(member.getHobbys()+member.getGender());
		model.addAttribute("member",member);
		return "member/doJoin";
	}
}
