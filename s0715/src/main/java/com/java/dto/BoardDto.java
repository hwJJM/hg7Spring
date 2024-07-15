package com.java.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

//@Getter
//@Setter
//date = getter&setter 동시에 가져옴
@Data   
@ToString
@NoArgsConstructor //기본 생성자
@AllArgsConstructor //모든 생성자
@Component
public class BoardDto {
	private int bno;
	private String btitle;
	
}
