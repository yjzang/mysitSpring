package com.javaex.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.UserDAO;
import com.javaex.vo.UserVO;

@Service
public class UserService {

	
	@Autowired
	private UserDAO dao ;
	
	public int join(UserVO vo) {
		
		return dao.insert(vo);
 
	}

	public UserVO login(HashMap<String, String> map) {
		
		return dao.getUser(map);
		
	}
	
	public UserVO modifyform(String no) {
		
		return dao.getAll(no);
		
	}
	
	
	public int modify(UserVO vo) {
		
		return dao.update(vo);
		
	}
	
	
	
}
