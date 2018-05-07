package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.FileVO;

@Repository
public class FileDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public void restore(FileVO vo){
		
		System.out.println("다오 "+ vo.toString());
		sqlSession.insert("galDB.insert",vo);
		
	
	}
	
	public List<FileVO> getList(FileVO vo){
		 
		return sqlSession.selectList("galDB.getList",vo);
		
	}
	
	public FileVO selectImg(int no) {
	
		return sqlSession.selectOne("galDB.selectImg",no);
	}
	
	public int delete(int no) {
		
		return sqlSession.delete("galDB.delete",no);
	}
	
	public void upLike(FileVO vo) {
		
		int flag = sqlSession.update("galDB.upLike",vo);
		System.out.println("다오 업데이트 여부 up"+flag);
	}
	
	public void downLike(FileVO vo) {
		
		int flag = sqlSession.update("galDB.downLike",vo);
		System.out.println("다오 업데이트 여부 down"+flag);
	}
	
	
}
