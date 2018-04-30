package com.javaex.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.service.UserService;
import com.javaex.vo.UserVO;

@Repository
public class UserDAO {

		@Autowired
		SqlSession sqlSession;
		
		public int insert(UserVO vo) {
	
			return sqlSession.insert("userDB.insert",vo);
			
		}
		
		public int update(UserVO vo) {
			
			return sqlSession.update("userDB.update",vo);
		}

		
		public UserVO getUser(HashMap<String, String> map) {

			return sqlSession.selectOne("userDB.getUser",map);
		}
		
		public UserVO getAll (String no) {
			
			return sqlSession.selectOne("userDB.getAll",no);
		}
		
		public String emailCheck (String email) {
			
			return sqlSession.selectOne("userDB.emailCheck", email);
		}
		
		
}
