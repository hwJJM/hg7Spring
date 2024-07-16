package com.java.service;

import java.util.ArrayList;

import com.java.dto.Member;

public interface MemberService {
	ArrayList<Member> memberSelectAll();

	Member memberSelectOne(String id);

	Member selectLogin(String id, String pw);
	
}
