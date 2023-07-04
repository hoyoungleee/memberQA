package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.boardservice.BoardService;
import com.example.demo.vo.BoardVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class BoardController {

   @Autowired
   BoardService boardService;

   @GetMapping("/boardwrite.do")
   public ModelAndView write(HttpServletRequest request, ModelAndView mav) {
       HttpSession session = request.getSession();
       String id = (String) session.getAttribute("id");

       if (id == null) {
           return new ModelAndView("redirect:/login.do");
       }

       //System.out.println(id);

       mav.addObject("tp", "write");
       mav.addObject("id", id);
       mav.setViewName("boardwrite");
       return mav;
   }
   
   /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
   
   // 쓰기 처리
   // value = 쓰기처리 하는 url? jsp에 action
   @RequestMapping(value = "/boardnewwrite.do", method = RequestMethod.POST)
   public ModelAndView write(BoardVO vo, HttpServletRequest request, ModelAndView mav) throws Exception {

      // 가져옴
      String a = request.getParameter("title");
      String b = request.getParameter("description");
      String c = request.getParameter("admin_answer");
      String d = request.getParameter("id");
      String e = request.getParameter("open");

      // vo에 넣음
      vo.setTitle(a);
      vo.setDescription(b);
      vo.setAdmin_answer(c);
      vo.setUser(d);
      vo.setText_open(e);
      
      //boardService에 insert실행(쿼리문)
      boardService.insert(vo);
      
      //mav.setViewName("redirect:/boardlist.do");
      mav.setViewName("redirect:/boardlist.do");
      
      return mav;

   }

   /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
   // update

      @RequestMapping("/updateaction.do")
      public ModelAndView modify(BoardVO vo, HttpServletRequest req, ModelAndView mav) throws Exception {
         vo.setTitle(req.getParameter("title"));
         vo.setDescription(req.getParameter("description"));
         vo.setAdmin_answer(req.getParameter("admin_answer"));
         vo.setP_id(req.getParameter("p_id"));
         vo.setText_open(req.getParameter("open"));
         vo.setTp("modify");
         boardService.update(vo);
         //mav.setViewName("redirect:/boardlist.do");
         mav.setViewName("redirect:/boardview.do?p_id=" + vo.getP_id());
         return mav;
      }

      //페이지이동
      @GetMapping("/boardupdate.do")
      public ModelAndView modify(HttpServletRequest req, ModelAndView mav, BoardVO vo) throws Exception {
          // 세션에서 id 값 가져오기
          HttpSession session = req.getSession();
          String id = (String) session.getAttribute("id");
//          System.out.println(id); // 값 확인

          vo.setId(id); // BoardVO에 값 설정
          BoardVO sessionlv = boardService.sessionlv(id); // 첫 번째 호출의 결과를 변수에 저장
          mav.addObject("sessionlv", sessionlv); // sessionlv 값을 ModelAndView에 추가(sessionlv. 이름으로 sessionlv 를 뿌린다)

//          System.out.println(mav.addObject("sessionlv", sessionlv)); // 값 확인
          String p_id = req.getParameter("p_id"); // pid 하드코딩
          BoardVO mod = boardService.view(p_id);
          mav.addObject("tp", "modify");
          mav.addObject("p_id", p_id);
          mav.addObject("update", mod);

          mav.setViewName("boardwrite");
          return mav;
      }

   /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
   
   //delete
   @RequestMapping(value = "/boarddelete.do", method = {RequestMethod.GET,RequestMethod.POST})
   public  ModelAndView delete(BoardVO vo, HttpServletRequest request, ModelAndView mav) throws Exception{
         
         String a = request.getParameter("p_id");
         //확인
//         System.out.println(a);
         //vo에 넣음
         vo.setP_id(a);
         
      //boardService에 delete실행(쿼리문)
      boardService.delete(vo);
      
      mav.setViewName("redirect:/boardlist.do");
       return mav;
   }
   
   /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
   
   //게시판 목록 
   
   //
//   @RequestMapping(value = "/boardlist.do")
//   //ModelAndView 무조건 
//   public ModelAndView list(BoardVO vo,ModelAndView mav) throws Exception{
//      
//      
//      List<BoardVO> lists = boardService.getLists();
//      mav.addObject("sang1lists", lists);
//      mav.setViewName("boardlist");
//      
//      
//      return mav;
//   }
   
   //페이지 이동하는거 하나 필요하고 
   // json list로 뿌려주는 거 하나 

   // 페이지 이동
   @GetMapping("/boardlist.do")
   public ModelAndView list(HttpServletRequest request, BoardVO vo,ModelAndView mav) throws Exception {
	   
	   //세션 값 가져오기
	   HttpSession session = request.getSession();
	   String memberid = (String) session.getAttribute("id");
	   // id값이 없으면 로그인 페이지로 이동
	   if (memberid == null) {
	      mav.setViewName("redirect:/login.do");
	      return mav;
	   }
	   
	   
      return mav;
   }
   
   

   //Ajax 추가
    @RequestMapping(value = "/boardAjax.do", produces = "application/json;charset=UTF-8")
    //json형태 
   @ResponseBody
   public List<BoardVO> boardList(HttpServletRequest request) throws Exception {
       
       //검색파라미터 
      String search = request.getParameter("search");
      
      //페이지
      int page = Integer.parseInt(request.getParameter("page"));
      //값 전달
      BoardVO vo = new BoardVO();
      vo.setSearch(search);
      vo.setPage(page);
      
       List<BoardVO> lists = boardService.getLists(vo);
       return lists;
   } 
   
    
   
   /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */   
   
    @RequestMapping(value = "/boardview.do")
    public ModelAndView boardview(BoardVO vo, ModelAndView mav, HttpServletRequest request) throws Exception {
    	//세션에서 id 값 가져오기
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        vo.setId(id); // BoardVO 객체에 id 값을 설정

        BoardVO sessionlv = boardService.sessionlv(id); // 첫 번째 호출의 결과를 변수에 저장
        mav.addObject("sessionlv", sessionlv); // sessionlv 값을 ModelAndView에 추가

       // System.out.println(sessionlv); // 변수에 저장된 sessionlv 값을 출력 (디버깅용)

        String p_id = request.getParameter("p_id");
        BoardVO views = boardService.view(p_id); // p_id 값을 사용하여 BoardVO 객체 조회


        mav.addObject("viewlist", views); // views 값을 ModelAndView에 추가
        mav.addObject("id", id); // id 값을 ModelAndView에 추가 (session 값)

        mav.setViewName("boardview"); // 뷰 이름 설정

        return mav; // ModelAndView 반환
    }

    
    // 페이지 이동
    @GetMapping("/icon.do")
    public ModelAndView icon(HttpServletRequest request, BoardVO vo,ModelAndView mav) throws Exception {
 	   
 	   
       return mav;
    }
}