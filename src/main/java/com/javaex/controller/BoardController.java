package com.javaex.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.BoardService;
import com.javaex.vo.BoardVO;
import com.javaex.vo.PagerVO;
import com.javaex.vo.UserVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value="/getList", method={RequestMethod.GET,RequestMethod.POST})
	public String getList(@ModelAttribute PagerVO vo, 
			   Model model) {
		
		ArrayList<BoardVO> list = null;
		HashMap<String, Object> map = null;
		
		map = (HashMap<String, Object>)service.getList(vo);
		list = (ArrayList<BoardVO>) map.get("list");
		vo = (PagerVO) map.get("vo");
		
		if(list.size()>0) {
			model.addAttribute("list", list);
			model.addAttribute("vo", vo);
			
		}
		
		return "/board/list";
	}
	
	@RequestMapping(value="/viewText",method= {RequestMethod.GET,RequestMethod.POST})
	public String viewText(@ModelAttribute BoardVO vo,@ModelAttribute PagerVO pagerVO, Model model) {
		
		BoardVO resultVO = service.getText(vo);
		
		model.addAttribute("vo",resultVO);
		model.addAttribute("pagerVO",pagerVO);
		return "board/view";
		
	}
	
	@RequestMapping(value="/writeform", method=RequestMethod.GET)
	public String writeForm(PagerVO vo,Model model) {
		
		model.addAttribute("vo",vo);
		return "board/write";
	}
	
	
	@RequestMapping(value="/write",method= {RequestMethod.GET,RequestMethod.POST})
	public String write( @ModelAttribute BoardVO vo,
						 @ModelAttribute PagerVO pagerVO,
						 HttpSession session) {
		
		UserVO authVO = (UserVO)session.getAttribute("authVO");
		System.out.println(authVO.getNo());
		vo.setUser_no(authVO.getNo());
		service.write(vo);
		return "redirect:/board/getList?page="+pagerVO.getPage()+"&page_set="+pagerVO.getPage_set();
	}

	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam String no,@ModelAttribute PagerVO pagerVO) {
		
		service.delete(no);
		return "redirect:/board/getList?page="+pagerVO.getPage()+"&page_set="+pagerVO.getPage_set();
		
	}
	
	@RequestMapping(value="/modifyform", method=RequestMethod.GET)
	public String modifyForm(@ModelAttribute BoardVO vo,@ModelAttribute PagerVO pagerVO,
							 Model model) {
		
		BoardVO resultVO = null;
		resultVO = service.getText(vo);
		model.addAttribute("vo",resultVO);
		model.addAttribute("pagerVO",pagerVO);
		return "board/modify";
		
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modify(@ModelAttribute BoardVO vo,@ModelAttribute PagerVO pagerVO
							 ) {

		service.modify(vo);
		return "redirect:/board/getList?page="+pagerVO.getPage()+"&page_set="+pagerVO.getPage_set();
	}
	
	
}
	
	
	

