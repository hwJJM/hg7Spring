package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Board {
	private int bno, bhit, bgroup, bstep, bindent;
	private String id, btitle, bcontent, bfile;
	private Timestamp bdate;
}
