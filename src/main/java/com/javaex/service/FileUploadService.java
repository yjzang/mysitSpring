package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.FileDAO;
import com.javaex.vo.FileVO;

@Service
public class FileUploadService {

	
	
		@Autowired
		FileDAO dao;
		
		public void restore(HashMap<String, Object> map) {
			
				MultipartFile file = (MultipartFile)map.get("file");
				FileVO vo =(FileVO)map.get("vo");
				
				String saveDir = "D:\\javaStudy\\upload";
				
		
				//오리지날 파일명
				String orgName = file.getOriginalFilename();
				System.out.println("orgName: "+ orgName);
				// 확장자
				String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
				System.out.println("exName: "+ exName);
						
				// 저장파일명
				String saveName = System.currentTimeMillis() + UUID.randomUUID().toString()+exName;
				System.out.println("saveName: " + saveName);
				
				// 파일패스
				String filePath = saveDir+"\\"+saveName;
				System.out.println("filePath: " + filePath);
				
			
				// 파일사이즈
				long fileSize = file.getSize();
				System.out.println("fileSize: "+fileSize);
				
				vo.setFilePath(filePath);
				vo.setFileSize(fileSize);
				vo.setOrgName(orgName);
				vo.setSaveName(saveName);
				System.out.println("서비스: " + vo.toString());
				dao.restore(vo);
								
				//파일 서버로 복사
				
				try {
					byte[] fileData = file.getBytes();               //메모리에 있는 파일을 서버로 내보낸다. --> outStream
					OutputStream out = new FileOutputStream(filePath);
					BufferedOutputStream bout = new BufferedOutputStream(out);
					
					bout.write(fileData);
					
					if(bout != null) {
						bout.close();
					}
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		}
		
		public ArrayList<FileVO> getList(int begin) {
			
			FileVO vo = new FileVO();
			int end=0;
			end = begin+15;
			vo.setBegin(begin);
			vo.setEnd(end);
			return (ArrayList<FileVO>)dao.getList(vo);
			
		}
		
		public FileVO selectImg(int no) {
			
			FileVO vo=dao.selectImg(no);
			return vo;
		}
		
		public String delete(int no) {
			
			String result="false";
			int flag= dao.delete(no);
			if(flag!=0) {
				result = "true";
			}
			return result;
		}
		
		
		
}
