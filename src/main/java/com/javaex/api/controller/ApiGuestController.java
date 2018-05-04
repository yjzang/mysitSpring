package com.javaex.api.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.GuestService;
import com.javaex.vo.GuestVO;


@Controller
@RequestMapping(value="/api/guest")
public class ApiGuestController {

	
	@Autowired
	private GuestService service;
	
	
	@ResponseBody
	@RequestMapping(value="/getList",method=RequestMethod.POST)
	public ArrayList<GuestVO> getList(@RequestParam int begin, Model model) {
	
		System.out.println("서비스 전"+begin);
		ArrayList<GuestVO> list =(ArrayList<GuestVO>)service.getList(begin);
		System.out.println("서비스 후"+begin);
		return list;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public GuestVO add(@RequestBody GuestVO vo) {
		
		GuestVO resultVO= service.add(vo);
		return resultVO;
	}
	
	@ResponseBody
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute GuestVO vo) {

		String result = service.delete(vo);
		return result;				
	
	}
	
	
}
