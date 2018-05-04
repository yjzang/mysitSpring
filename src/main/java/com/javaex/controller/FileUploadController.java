package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.FileUploadService;
import com.javaex.vo.FileVO;

@Controller
@RequestMapping("/fileupload")
public class FileUploadController {

		@Autowired
		FileUploadService service;
	
		@RequestMapping(value = "/form", method=RequestMethod.GET)
		public String fileForm() {
			
			
			
			return "fileupload/form";
		}
		
		@RequestMapping(value = "/upload", method=RequestMethod.POST)
		public String fileUpload(@RequestParam("file") MultipartFile file,
								 @RequestParam("file2") MultipartFile file2,
								 @RequestParam("file3") MultipartFile file3,
								 Model model) {
			
			
			System.out.println(file);
			System.out.println(file.toString());
			System.out.println(file.getOriginalFilename());
			FileVO vo = service.restore(file);
			FileVO vo2 = service.restore(file2);
			FileVO vo3 = service.restore(file3);
			System.out.println(vo.toString());
			System.out.println(vo2.toString());
			System.out.println(vo3.toString());
			
			model.addAttribute("vo",vo);
			model.addAttribute("vo2",vo2);
			model.addAttribute("vo3",vo3);
			
			return "fileupload/result";
		}
		
}
