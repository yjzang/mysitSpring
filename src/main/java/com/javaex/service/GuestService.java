package com.javaex.service;

import java.util.ArrayList;
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
		public List<GuestVO> getList(int begin){
			
			GuestVO vo = new GuestVO();
			int end=0;
			end = begin+4;
			vo.setBegin(begin);
			vo.setEnd(end);
			return dao.getList(vo);
		}
		
		@RequestMapping
		public GuestVO add(GuestVO vo){
			
			int no = dao.add(vo);
			ArrayList<GuestVO> list = (ArrayList<GuestVO>)dao.getList_target(no) ;
			return list.get(0);
			
		}
		
		@RequestMapping
		public String delete(GuestVO vo){
			
			int flag = dao.delete(vo);
			String result = "false";
			if(vo.getPassword()==null||vo.getPassword()=="") {
				
				result="empty";
				
			} else if(flag!=0) {
				
				result="true";
			} 
			return result;
		}
		
			
	
}
