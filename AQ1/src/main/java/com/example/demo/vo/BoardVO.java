package com.example.demo.vo;

import java.sql.Date;

import lombok.Data;

public class BoardVO {
	

	private String title; 		//제목
	private String description; //설명이 아님 문의글
	private Date reg_dt;		//작성날짜
	private String text_open;   //개방여부
	private String answer;		//답변여부
	private String admin_answer;//답변
	private String p_id;           //일련번호 Local_ID
	private String user;//답변
	private String tp; // case 알지?
	
	
	
	
	
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	
	
	
	public String getTp() {
		return tp;
	}
	public void setTp(String tp) {
		this.tp = tp;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getText_open() {
		return text_open;
	}
	public void setText_open(String text_open) {
		this.text_open = text_open;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getAdmin_answer() {
		return admin_answer;
	}
	public void setAdmin_answer(String admin_answer) {
		this.admin_answer = admin_answer;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}


	
	
	
}
