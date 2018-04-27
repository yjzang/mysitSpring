package com.javaex.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GuestVO;

@Repository
public class GuestDAO {

	
	@Autowired
	private SqlSession sqlSession;
	
	public void add(GuestVO vo) {
		
		System.out.println(vo.toString());
		sqlSession.insert("guestbook.insert",vo);
		
	}
	
	public int delete(HashMap<String, String> map) {
		
		return sqlSession.delete("guestbook.delete",map);
		
	}
	
	public List<GuestVO> getList() {
		
		return sqlSession.selectList("guestbook.list");
	}
	
	
}
	