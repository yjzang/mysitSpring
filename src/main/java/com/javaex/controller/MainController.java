package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main() {
		
		return "main/index";
		
	}
	
	
	@RequestMapping(value="/board/main", method=RequestMethod.GET )
	public String board_main(Model model) {
		
		String begin= null;
		String end = null;
		model.addAttribute("begin",begin);
		model.addAttribute("end",end);
		return "board/list";
	}

}
