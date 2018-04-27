package com.javaex.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.BoardDAO;
import com.javaex.vo.BoardVO;
import com.javaex.vo.PagerVO;

@Service
public class BoardService {

	@Autowired
	BoardDAO dao;
	
	public HashMap<String, Object> getList(PagerVO vo) {
		
		int begin = vo.getBegin();
		int end = vo.getEnd();
		int page = vo.getPage();
		int count = 0;
		int page_set= vo.getPage_set();
		int text_count= 10;
		String kwd=vo.getKwd();
		
		begin= (page_set)*text_count+page*text_count+1;
		end = (page_set)*text_count+(page+1)*text_count;
		count = dao.getList_count(kwd);
		
		vo.setBegin(begin);
		vo.setEnd(end);
		vo.setCount(count);
		vo.setPage(page);
		vo.setPage_set(page_set);
		vo.setKwd(kwd);
		
		ArrayList<BoardVO> list = null;
		list = (ArrayList<BoardVO>)dao.getList(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("list",list);
		
		return map;
		
	}
	
	
	public BoardVO getText(BoardVO vo) {
		
		String hit = vo.getHit();
		String no = vo.getNo();
		
		if(hit!=null) {
			int hit_int = Integer.parseInt(hit);
			dao.upHit(no, hit_int);
		}
		
	
		BoardVO resultVO = dao.getText(no);
		
		return resultVO;
	}
	
	public void write(BoardVO vo) {
		
		dao.insert(vo);
				
	}
	
	public void delete(String no) {
		
		dao.delete(no);
		
	}
	
	public void modify(BoardVO vo) {
		
		dao.update(vo);
		
	}
	
}
