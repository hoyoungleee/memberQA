package com.example.demo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private MemberMapper memberMapper;

}
