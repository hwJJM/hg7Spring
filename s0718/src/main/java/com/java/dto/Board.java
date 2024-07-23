package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int bno;
	private String id;
	private String btitle;
	private String bcontent;
	private Timestamp bdate;
	private int bhit, bgroup, bstep, bindent;
	private String bfile;
}
