package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Member;
import com.java.mapper.MemberMapper;

@Service
public class MemberServicelmpl implements MemberService {
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public ArrayList<Member> memberSelectAll() {
		ArrayList<Member> list = memberMapper.memberSelectAll();
		
		return list;
		
		//mapper 는 db // service 는 db와 관련된 일을 하는 중간역할자
	}
	
	//회원 한명의 정보아이디로 가져오기
	@Override
	public Member memberSelectOne(String id) {
		Member member = memberMapper.memberSelectOne(id);
		return member;
	}
	//로그인을 위한 메서드
	@Override
	public Member selectLogin(String id, String pw) {
		Member member = memberMapper.selectLogin(id,pw);
		return member;
	}

}
