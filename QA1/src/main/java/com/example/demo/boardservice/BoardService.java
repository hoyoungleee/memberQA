package com.example.demo.boardservice;


import java.util.List;

import com.example.demo.vo.BoardVO;

public interface BoardService {

   // BoardDTO 에 선언했으니까 dto 타입으로 가져온다는 느낌
   // List<BoardDTO> 여러줄일떄는 LIST로 한다 DTO 에 있는걸 배열 느낌으로 다 가져옴
   // public List<BoardDTO> getLists(BoardDTO dto) throws Exception; 쿼리문에 파라미터 조건
   // 없으면 아래와 같이
   /* public List<MemberVO> getLists() throws Exception; */
   
   //ListSelect      
   public List<BoardVO> getLists(BoardVO vo) throws Exception;
   
   //insert
   public void insert(BoardVO vo) throws Exception;
   
   //update
   public void update(BoardVO vo) throws Exception;
   
   //delete
   public void delete(BoardVO vo) throws Exception;
   
//   //view
   public BoardVO view(String id) throws Exception;
   
   
   //max count
   public int count(String search) throws Exception;
   
   //session값 
   public BoardVO sessionlv(String id) throws Exception;

}