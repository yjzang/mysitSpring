package com.javaex.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.BoardVO;
import com.javaex.vo.PagerVO;
import com.javaex.vo.UserVO;


@Repository
public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<BoardVO> getList(PagerVO vo) {
		
			
		return sqlSession.selectList("boardDB.getList", vo );
		
	}
	
	public int getList_count(String kwd) {
		
		return sqlSession.selectOne("boardDB.getList_count",kwd);
		
	}
	public BoardVO getText(String no) {

		
		return sqlSession.selectOne("boardDB.getText",no);
		
	}
	
	
	public void update(BoardVO vo) {
	
		
		sqlSession.update("boardDB.update",vo);
		
	}
	
	public void upHit(String no,int hit) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("hit",hit);
		
		sqlSession.update("boardDB.upHit",map);
		
	}
	
	public void insert(BoardVO vo) {

		sqlSession.update("boardDB.insert",vo);
		
	}
	
	public void delete(String no) {
		
		sqlSession.delete("boardDB.delete",no);
	}	
	public List<BoardVO> searchList(String kwd) {
		
		return sqlSession.selectList("boardDB.searchList",kwd);
	}
	
	
}
