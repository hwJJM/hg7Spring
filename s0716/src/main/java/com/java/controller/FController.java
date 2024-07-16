package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller    //컨트롤러라고 선언해줘야 이것을 찬아옴
public class FController {
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
}
