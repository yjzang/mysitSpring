package com.javaex.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.UserService;
import com.javaex.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping(value="/loginform",method=RequestMethod.GET) 
	public String loginForm(){
		
		return "user/loginform";
		
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@RequestParam String email,@RequestParam String password,
						HttpSession session) {

		String url=null;
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("password", password);
		UserVO vo= service.login(map);
		
		if (vo == null) {
			System.out.println("로그인 실패");
			url= "redirect: /mysiteSpring/user/loginform?result=fail";

		}else {
			session.setAttribute("authVO",vo);
			url= "redirect: /mysiteSpring/main";
		}
		
		
		return url;
	}
	
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		
		session.removeAttribute("authVO");
		session.invalidate();
		return "redirect:/main";
		
	}
	
	
	
	@RequestMapping(value="/joinform",method=RequestMethod.POST) 
	public String joinForm(){
		
		return "user/joinform";
		
	}
	


	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(@ModelAttribute UserVO vo) {

		service.join(vo);
		return "redirect:/main";
		
	}
	
	@RequestMapping(value="/modifyform",method=RequestMethod.GET) 
	public String modifyForm(HttpSession session,Model model){
		
		UserVO authVO = (UserVO)session.getAttribute("authVO");
		System.out.println(authVO.getNo());
		UserVO vo = service.modifyform(authVO.getNo());
		System.out.println(vo.toString());
		model.addAttribute("vo",vo);
		return "user/modifyform";
		
	}
	
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modify(@ModelAttribute UserVO vo) {

		service.modify(vo);
		return "redirect:/main";
				
		
	}
	
	
}
