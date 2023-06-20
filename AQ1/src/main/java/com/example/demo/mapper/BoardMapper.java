package com.example.demo.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BoardVO;

@Mapper
public interface BoardMapper {
	
	
	//ListSelect
	//조건 없어서 아래와 같이 해도 상관 없음
	public List<BoardVO> getLists() throws Exception;

	//insert
	public void insert(BoardVO vo) throws Exception;
	
	//update
	public void update(BoardVO vo) throws Exception;
	
	//delete
	public void delete(BoardVO vo) throws Exception;
	
	public BoardVO view(String id) throws Exception;
	
	
	
}
