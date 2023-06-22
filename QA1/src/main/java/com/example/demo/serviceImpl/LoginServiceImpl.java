package com.example.demo.serviceImpl;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.SHA256;
import com.example.demo.mapper.MemberMapper;
import com.example.demo.service.LoginService;
import com.example.demo.vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public int getLoginCheck(MemberVO memberVO) {
		SHA256 sha256 = new SHA256();
		
		String lawPw = memberVO.getPw();
		
		try {
			String cryptogram = sha256.encrypt(lawPw);
			memberVO.setPw(cryptogram);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result = memberMapper.getLoginCheck(memberVO);
		return result;
	}
}
