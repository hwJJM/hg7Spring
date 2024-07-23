package com.java.service;

import org.springframework.stereotype.Service;

import com.java.dto.Member;


public interface MService {

	Member selectLogin(String id, String pw);

}
