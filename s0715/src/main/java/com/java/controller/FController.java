package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.BoardDto;
import com.java.service.BService;
import com.java.service.BServiceImpl;
import com.java.service.BServiceImpl2;

@Controller
public class FController {
	//iv
	//Autowired 객체를 생성하지 않아도 사용할 수 있게 해줌 : DI라고함
	//스프링은 내가 객체를 선언하지 않아도 스프링이 해준다.
	@Autowired
	BoardDto bdto;
	//BoardDto bdto = new BoardDto();
	//다형성
	BServiceImpl bservice1 = new BServiceImpl();
	BServiceImpl2 bservice2 = new BServiceImpl2();
	
	@Autowired  //@serbice가 붙은 위치에 적용이 됨 ->> 필요한 서비스에 붙여서 이용
	BService bservice; 
	
	
	@RequestMapping("/index")  //주소
	public String index() {
		bdto.setBno(1);
		System.out.println(bdto.getBno());
		System.out.println(bservice1.add());	//15
		System.out.println(bservice2.add());	//300
		System.out.println(bservice.add());  //15
		return "index";
	}
	
	
	
}
