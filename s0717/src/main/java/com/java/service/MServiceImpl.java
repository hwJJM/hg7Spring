package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Member;
import com.java.mapper.MemberMapper;

@Service
public class MServiceImpl implements MService{

	@Autowired
	MemberMapper mMapper;
	@Override
	public Member selectLogin(String id, String pw) {
		Member member = mMapper.selectLogin(id, pw);
		return member;
	}
	@Override
	public ArrayList<Member> selectMemberAll() {
		ArrayList<Member> list = mMapper.selectMemberAll();
		return list;
	}
	@Override
	public void insertMember(Member member) {
		mMapper.insertMember(member);
		
	}

}
