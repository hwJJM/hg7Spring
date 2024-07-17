package com.java.controller;

import java.util.ArrayList;

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
@RequestMapping("/member")
public class Mcontroller {
	@Autowired	HttpSession session;
	@Autowired	MService mService;
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	@PostMapping("/join")
	public String doJoin(Member member, String[] hobby, Model model) {
		String hobbys="";
		for(int i=0;i<hobby.length;i++) {
			if(i==0) hobbys+=hobby[i];
			else hobbys+=", "+hobby[i];
		}
		member.setHobbys(hobbys);
		mService.insertMember(member);
		return "redirect:/";
	}
	//전체멤버확인
	@RequestMapping("/mlist")
	public String mlist(Model model) {
		ArrayList<Member> list = mService.selectMemberAll();
		System.out.println(list.get(0).getId());
		model.addAttribute("list",list);
		return "member/mlist";
	}
	@RequestMapping("/login")
	public String login() {
		//login.jsp 기본페이지 여는 부분
		return "member/login";
	}
	@RequestMapping("/doLogin")
	//login 페이지에서 submit 버튼을 눌렀을 때 연결되는 부분
	public String doLogin(Member member, Model model) {
		System.out.println("doLogin id : "+member.getId());
		System.out.println("doLogin pw : "+member.getPw());
		Member m = mService.selectLogin(member.getId(), member.getPw());
		
		//System.out.println("doLogin db 연결 확인 id : "+m.getId());
		if(m!=null) {
			session.setAttribute("sessionId", m.getId());
			session.setAttribute("sessionName", m.getName());
			model.addAttribute("loginCk",1);
		}else {
			model.addAttribute("loginCk",0);
		}
		return "member/doLogin";
	}
	@RequestMapping("/logout")
	public String logout(Model model) {
		session.invalidate();
		model.addAttribute("logout",1);
		return "member/logout";
	}
}
