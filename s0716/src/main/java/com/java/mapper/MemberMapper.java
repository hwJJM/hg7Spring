package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Member;

@Mapper
public interface MemberMapper {
	//회원전체정보
	ArrayList<Member> memberSelectAll();
	//회원 한명의 정보 가져오기
	Member memberSelectOne(String id);
	//로그인
	Member selectLogin(String id, String pw);
}
