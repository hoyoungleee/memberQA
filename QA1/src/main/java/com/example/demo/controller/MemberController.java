package com.example.demo.controller;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.checkerframework.checker.units.qual.m;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.serviceImpl.MemberServiceImpl;
import com.example.demo.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

	@Autowired
	MemberServiceImpl memberServiceImpl;

	@GetMapping("/reg.do")
	public String regMember() {
		return "regMember";
	}

	@GetMapping("/idCheck.do")
	public String checkPop() {
		return "idCheck";
	}
	
	@GetMapping("/update.do")
	public String udtMember(HttpServletRequest request,ModelMap model) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberVO memberVO = new MemberVO();
		
		memberVO.setId(id);
		
		MemberVO member = memberServiceImpl.selectMember(memberVO);
		
		model.addAttribute("member",member);
		
		return "udtMember";
	}

	@PostMapping("/checkId.do")
	@ResponseBody
	public int getIdCheck(HttpServletRequest request) {
		String checkingId = request.getParameter("id");

		MemberVO memberVO = new MemberVO();

		memberVO.setId(checkingId);
		
		int result = memberServiceImpl.getIdCheck(memberVO);
		
		System.out.println("쿼리값=" + result + "checkid=" + checkingId);
		
		return result;
	}

	@PostMapping("/join.do")
	@ResponseBody
	public int joinMember(HttpServletRequest request) {

		MemberVO memberVO = new MemberVO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		memberVO.setId(id);
		memberVO.setAddress(address);
		memberVO.setBirth(birth);
		memberVO.setEmail(email);
		memberVO.setGender(gender);
		memberVO.setPw(pw);
		memberVO.setName(name);
		
		
		int result = memberServiceImpl.joinMember(memberVO);
		return result;
	}

}
