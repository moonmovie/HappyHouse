package com.ssafy.happyhouse.services;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.WishDao;
import com.ssafy.happyhouse.model.WishDto;

@Service
public class WishServiceImpl implements WishService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<WishDto> wishList(String userId) throws SQLException {
		return sqlSession.getMapper(WishDao.class).wishList(userId);
	}
	
	@Override
	public void registWish(String userId, String AptName) throws SQLException{
		sqlSession.getMapper(WishDao.class).registWish(userId, AptName);
	}

	@Override
	public void deleteWish(String userId, String AptName) throws SQLException{
		sqlSession.getMapper(WishDao.class).deleteWish(userId, AptName);
	}

	@Override
	public int checkWish(String userId, String AptName) throws SQLException {
		return sqlSession.getMapper(WishDao.class).checkWish(userId, AptName);
	}
	
	
}
