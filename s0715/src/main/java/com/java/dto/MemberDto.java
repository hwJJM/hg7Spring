package com.java.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class MemberDto {
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String job;
	private String hobby;
}
