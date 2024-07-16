package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data   				//setter&getter
@AllArgsConstructor		//모든생성자
@NoArgsConstructor		//기본생성자
public class Member {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String gender;
	private String hobbys;
}
