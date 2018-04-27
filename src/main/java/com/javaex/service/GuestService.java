package com.javaex.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaex.dao.GuestDAO;
import com.javaex.vo.GuestVO;

@Service
public class GuestService {

	
		@Autowired
		private GuestDAO dao;
		
		@RequestMapping
		public List<GuestVO> getList(){
			
			return dao.getList();
		}
		@RequestMapping
		public void add(GuestVO vo){
			
			dao.add(vo);
			
		}
		
		@RequestMapping
		public int delete(HashMap<String, String> map){
			
			return dao.delete(map);
		}
		
			
	
}
