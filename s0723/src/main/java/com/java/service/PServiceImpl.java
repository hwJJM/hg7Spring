package com.java.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.Product;
import com.java.mapper.PMapper;

@Service

public class PServiceImpl implements PService {
	@Autowired PMapper pMapper;
	@Override
	public ArrayList<Product> selectAll() {
		ArrayList<Product> plist = pMapper.selectAll();
		return plist;
	}
	@Override
	public Product insertProductInfo(Product pdto) {
		System.out.println("before");
		System.out.println(pdto.getPno());
		System.out.println(pdto.getName());
		//데이터베이스에 pdto 정보를 insert하기.
		pMapper.insertOne(pdto);
		System.out.println("after");
		System.out.println(pdto.getPno());
		System.out.println(pdto.getName());
		System.out.println(pdto.getPdate());
		//그 pno 정보를 가지고 데이터베이스에서 product 정보한개를 찾아서 리턴해줘야함
		Product product = pMapper.selectOne(pdto);
		System.out.println(product.getPdate());
		//return product;
		return product;
	}


}
