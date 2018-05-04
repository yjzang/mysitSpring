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
	
	public int add(GuestVO vo) {
		
		sqlSession.insert("guestbook.insert",vo);
		System.out.println(vo.getNo());
		return vo.getNo();
	}
	
	public int delete(GuestVO vo) {
		
		return sqlSession.delete("guestbook.delete",vo);
		
	}
	
	public List<GuestVO> getList(GuestVO vo) {
		
		return sqlSession.selectList("guestbook.list",vo);
	}
	
	public List<GuestVO> getList_target(int no) {
		
		return sqlSession.selectList("guestbook.list_target",no);
	}
	
	
}
	