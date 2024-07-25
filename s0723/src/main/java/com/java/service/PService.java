package com.java.service;

import java.util.ArrayList;

import com.java.dto.Product;

public interface PService {

	ArrayList<Product> selectAll();

	Product insertProductInfo(Product pdto);

}
