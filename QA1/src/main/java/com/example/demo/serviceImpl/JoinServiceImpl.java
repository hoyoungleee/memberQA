package com.example.demo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.service.JoinService;

@Service
public class JoinServiceImpl implements JoinService {

	
	@Autowired
	private MemberMapper memberMapper;
}
