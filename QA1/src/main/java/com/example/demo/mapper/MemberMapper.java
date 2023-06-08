package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVO;

@Mapper
public interface MemberMapper {

	List<MemberVO> getMemberList();
}
