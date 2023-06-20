package com.example.demo.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.boardservice.BoardService;
import com.example.demo.vo.BoardVO;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class BoardController {

	@Autowired
	BoardService boardService;

	// 페이지 이동
	@GetMapping("/boardwrite.do")
	public ModelAndView write(ModelAndView mav) {
		mav.addObject("tp", "write");
		mav.setViewName("boardwrite");
		return mav;
	}

	

	

	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	
	
	
	// 쓰기 처리
	// value = 쓰기처리 하는 url? jsp에 action
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView write(BoardVO vo, HttpServletRequest request, ModelAndView mav) throws Exception {

		// 가져옴
		String a = request.getParameter("title");
		String b = request.getParameter("description");
		System.out.println(a);
		System.out.println(b);


		// vo에 넣음
		vo.setTitle(a);
		vo.setDescription(b);
		//boardService에 insert실행(쿼리문)
		boardService.insert(vo);
		
		mav.setViewName("redirect:/boardlist.do");
		
		return mav;
		
		
		

	}

	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */

	//기능
	
	
	// update

	   @RequestMapping("/updateaction.do")
	   public ModelAndView modify(BoardVO vo, HttpServletRequest req, ModelAndView mav) throws Exception {
	      vo.setTitle(req.getParameter("title"));
	      vo.setDescription(req.getParameter("description"));
	      vo.setTp("modify");
	      boardService.update(vo);
	      mav.setViewName("redirect:/boardlist.do");
	      return mav;
	   }
	   @GetMapping("/update.do")
	   public ModelAndView modify(HttpServletRequest req,BoardVO vo,ModelAndView mav) throws Exception {
//	      int pid = Integer.parseInt(req.getParameter("p_id"));
	      String id = req.getParameter("p_id"); //pid 하드코딩
	      System.out.println(id);
	      BoardVO mod  = boardService.view(id);
//	      int p_id = mod.getP_id();
	      mav.addObject("tp", "modify");
//	      mav.addObject("p_id", id); //하드코딩
//	      mav.addObject("title", mod.getTitle()); //하드코딩
	      mav.addObject("update", mod);
	      mav.setViewName("boardwrite");
	      return mav;
	   }		
		
		


	
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	
	
	
	//delete
	@RequestMapping(value = "/delete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public  ModelAndView delete(BoardVO vo, HttpServletRequest request, ModelAndView mav) throws Exception{
			
			String a = request.getParameter("p_id");
			//확인
			System.out.println(a);
			//vo에 넣음
			vo.setP_id(a);
			//vo.setP_id("7");
			
		//boardService에 delete실행(쿼리문)
		boardService.delete(vo);
		
		mav.setViewName("redirect:/boardlist.do");
	    return mav;
		
 
	}
	

	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
	
	//게시판 목록 
	
	@RequestMapping(value = "/boardlist.do")
	//ModelAndView 무조건 
	public ModelAndView list(BoardVO vo,ModelAndView mav) throws Exception{
		
		List<BoardVO> lists = boardService.getLists();
		
		
		mav.addObject("sang1lists", lists);
		mav.setViewName("boardlist");
		
		System.out.println(lists);
		
		return mav;
	}
	
	
	
	/*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */	
	
	//상세보기 
	
	@RequestMapping(value = "/boardview.do")
	//ModelAndView 무조건 
	public ModelAndView view(BoardVO vo, ModelAndView mav, HttpServletRequest request) throws Exception{
		String p_id = request.getParameter("p_id");

		   BoardVO views = boardService.view(p_id);

		   mav.addObject("viewlist", views);

		   mav.setViewName("boardview");
		
		return mav;
	}
	
	
	
	
//	@RequestMapping(value = "/boardview.do", method = RequestMethod.GET)
//	   public ModelAndView view(ModelAndView mav, HttpServletRequest req) throws Exception{
//	      //p_id가 String일때
//		 int pid = Integer.parseInt(req.getParameter("p_id"));
//		   // int id = 2;
//		   BoardVO view = boardService.view(pid);
//		   mav.addObject("view", view);
//		   
//		   mav.setViewName("boardview");
//		   
//		   return mav;
//	   }
//	
	

	
	
	
	
	
	
	
	
	

}
