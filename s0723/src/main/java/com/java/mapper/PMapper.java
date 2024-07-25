package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.Product;

@Mapper
public interface PMapper {

	ArrayList<Product> selectAll();

	void insertOne(Product pdto);

	Product selectOne(Product pdto);


}
