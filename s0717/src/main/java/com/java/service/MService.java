package com.java.service;

import java.util.ArrayList;

import com.java.dto.Member;

public interface MService {

	Member selectLogin(String id, String pw);

	ArrayList<Member> selectMemberAll();

	void insertMember(Member member);

}
