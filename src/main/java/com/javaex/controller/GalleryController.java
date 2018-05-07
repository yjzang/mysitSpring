package com.javaex.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.FileUploadService;
import com.javaex.vo.FileVO;
import com.javaex.vo.UserVO;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

	@Autowired
	FileUploadService service;
	HttpSession session;
	
	
	@RequestMapping(value="/form",method=RequestMethod.GET)
	public String form() {
		
		return "gallery/list";
	
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/getList",method= {RequestMethod.GET, RequestMethod.POST})
	public ArrayList<FileVO> getList(@RequestParam int begin, Model model) {
		
		ArrayList<FileVO> list =(ArrayList<FileVO>)service.getList(begin);
		return list;
	
	}
	
	

	@RequestMapping(value = "/upload", method=RequestMethod.POST)
	public String fileUpload(@RequestParam("files") MultipartFile[] files ,
							 @ModelAttribute FileVO vo,
							 Model model) {
		
		System.out.println("컨트롤러 :" + vo.getUserNo());
		for(MultipartFile file: files) {
			
			System.out.println("배열로 받아지는지 보자" +file.getOriginalFilename());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("vo", vo);
			map.put("file",file);
					
			service.restore(map);
		}
	
		return "gallery/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/zoom", method=RequestMethod.POST)
	public FileVO zoom(@RequestParam("no") int no) {
		
			
		FileVO vo= service.selectImg(no);
		
		return vo;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("no") int no) {
		
			
		String result= service.delete(no);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/upLike", method=RequestMethod.POST)
	public FileVO upLike(@ModelAttribute FileVO vo) {
		
		System.out.println("스테이트"+vo.getState());
		FileVO resultVO = service.upLike(vo);
		System.out.println("서비스 다녀온"+vo.getState());
		return resultVO;
	}
	

	
}
