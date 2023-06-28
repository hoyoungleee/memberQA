package com.example.demo.boardservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

   @Autowired 
   private BoardMapper memberMapper; // BoardMapper의 의존성 주입

   
   @Override
   public void insert(BoardVO vo) throws Exception {
      memberMapper.insert(vo);
   }

   @Override
      public void update(BoardVO vo) throws Exception{
      memberMapper.update(vo);
      }
   
   @Override
   public void delete(BoardVO vo) throws Exception {
      memberMapper.delete(vo);
   }
   
   
   @Override
   public List<BoardVO> getLists(BoardVO vo) throws Exception {
      
      
      return memberMapper.getLists(vo);
      
   }
   
   
   @Override
   public BoardVO view(String id) throws Exception {
      return memberMapper.view(id);
   }
   

   
   
   @Override
   public int count(String search) throws Exception {
      int count = memberMapper.count(search);
      return count;
      
   }
   
   
   
   

   @Override
	public BoardVO sessionlv(String id) throws Exception {
		return memberMapper.sessionlv(id);
	}
   
   
}