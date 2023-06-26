package com.example.demo.serviceImpl;


import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.SHA256;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.service.MemberService;
import com.example.demo.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	
	@Autowired
	private MemberMapper mapper;
	@Override
	public int joinMember(MemberVO memberVO) {
		
		SHA256 sha256 = new SHA256();
		
		String lawPw = memberVO.getPw();
		
		try {
			String cryptogram = sha256.encrypt(lawPw);
			memberVO.setPw(cryptogram);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		int result = mapper.joinMember(memberVO);
		return result;
	}
	@Override
	public int updateMember(MemberVO memberVO) {
		
		int result = mapper.updateMember(memberVO);		
		return result;
		
	};
	@Override
	public int deleteMember(MemberVO memberVO) {
		int result = mapper.deleteMember(memberVO);
		return result;
	}
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		MemberVO result = mapper.selectMember(memberVO);
		return result;
	}
	@Override
	public int getIdCheck(MemberVO memberVO) {
		int result = mapper.getIdCheck(memberVO);
		return result;
	}
	
}
