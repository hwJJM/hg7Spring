package com.java.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.dto.Product;
import com.java.service.PService;

@Controller
public class FController {
	@Autowired PService pService;
	@RequestMapping("/")
	public String index() {
		return "main";
	}
	@RequestMapping("/ajax01")
	public String ajax01() {
		return "ajax01";
	}
	@RequestMapping("/ajax02")
	public String ajax02() {
		return "ajax02";
	}
	@RequestMapping("/product")
	public String product() {
		return "product";
	}
	@RequestMapping("/productList")
	@ResponseBody  //데이터 주고받기할때 꼭 넣기. 없으면 그냥 페이지 열기. 
					//ajax은 꼭 넣어주기 있으면 리턴값 전달
	public ArrayList<Product> prouctList() {
		ArrayList<Product> plist = pService.selectAll();
		return plist;
	}
	@PostMapping("/insertProductInfo")
	@ResponseBody
	public Product insertProductInfo(Product pdto) {
//		System.out.println("name : "+pdto.getName());
//		System.out.println("price : "+pdto.getPrice());
//		System.out.println("category : "+pdto.getCategory());
//		Product product = new Product();
//		product.setName(pdto.getName());
//		product.setPrice(pdto.getPrice());
//		product.setCategory(pdto.getCategory());
		Product product = pService.insertProductInfo(pdto);
		return product; 
	}
	
}
