package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.serviceImpl.LoginServiceImpl;
import com.example.demo.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	@Autowired
	LoginServiceImpl serviceImpl;
	
	@GetMapping("/login.do")
	public String login() {
		return "login";
	}
	@PostMapping("/checkMember.do")
	@ResponseBody
	public int checkMember(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(id);
		memberVO.setPw(pw);
		
		int result = serviceImpl.getLoginCheck(memberVO);
		
		if(result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		}
		
		return result;
	}
	@GetMapping("/logout.do")
	public String loginOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "index";
	}
	
}
