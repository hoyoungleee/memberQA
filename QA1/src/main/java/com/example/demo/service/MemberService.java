package com.example.demo.service;

import com.example.demo.vo.MemberVO;

public interface MemberService {

	public int joinMember(MemberVO memberVO);
	public int updateMember(MemberVO memberVO);
	public int deleteMember(MemberVO memberVO);
	public MemberVO selectMember(MemberVO memberVO);
	
	public int getIdCheck(MemberVO memberVO);
}
