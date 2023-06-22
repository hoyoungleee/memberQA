package com.example.demo.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {

	private String title; // 제목
	private String description; // 설명이 아님 문의글
	private Date reg_dt; // 작성날짜
	private String text_open; // 개방여부
	private String answer; // 답변여부
	private String admin_answer;// 답변
	private String p_id; // 일련번호 Local_ID
	private String tp; // case 알지?
	private String name;// 이름
	private String user;// ID
	private String lv;// 계급
	private String search;// 검색어
	
	
	
	
	//페이지
	private int page;// 페이지
    private int recordPerPage;  // 페이지당 출력할 데이터 개수
    private int pageSize;       // 화면 하단에 출력할 페이지 개수
	
	
	
	
	
    
    
    
    
    
    
    
    
    
    
    
    
	
	
	
	
	public int getRecordPerPage() {
		return recordPerPage;
	}

	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLv() {
		return lv;
	}

	public void setLv(String lv) {
		this.lv = lv;
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
