package com.javaex.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.GuestService;
import com.javaex.vo.GuestVO;


@Controller
@RequestMapping(value="/guest")
public class GuestController {

	@Autowired
	private GuestService service;
	
	
	@RequestMapping(value="/ajaxList", method= {RequestMethod.GET, RequestMethod.POST})
	public String ajaxList(Model model) {
		
	/*	ArrayList<GuestVO> list =(ArrayList<GuestVO>)service.getList();
		model.addAttribute("list",list);*/
		
		return "/guestbook/ajax_list";
	}
	
	@RequestMapping(value="/getList", method= {RequestMethod.GET, RequestMethod.POST})
	public String getList(Model model) {
		
		ArrayList<GuestVO> list =(ArrayList<GuestVO>)service.getList();
		model.addAttribute("list",list);
		
		return "/guestbook/list";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(GuestVO vo) {
		
		System.out.println(vo.toString());
		service.add(vo);
		return "redirect:/guest/getList";
	}
	
	@RequestMapping(value="/deleteform", method=RequestMethod.GET)
	public String deleteForm() {
		
		return "/guestbook/deleteform";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute GuestVO vo, Model model) {
		
		String result = service.delete(vo);
		if(result=="true") {
			return "redirect:/guest/getList";
		} else{
			model.addAttribute("result", result);
			return "/guestbook/deleteform";
		}
		
	}
	
	
	
}
