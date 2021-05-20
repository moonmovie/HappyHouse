package com.ssafy.happyhouse.services;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.NoticeDao;
import com.ssafy.happyhouse.model.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeDto> noticeList() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(NoticeDao.class).noticeList();
	}

	@Override
	public boolean registNotice(NoticeDto notice) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(NoticeDao.class).registNotice(notice) == 1;
	}

	@Override
	public boolean modifyNotice(NoticeDto notice) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(NoticeDao.class).modifyNotice(notice) == 1;
	}

	@Override
	public boolean deleteNotice(int noticeno) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(NoticeDao.class).deleteNotice(noticeno) == 1;
	}
	
	@Override
	public NoticeDto search(int no) throws SQLException{
		return sqlSession.getMapper(NoticeDao.class).search(no);
	}

	@Override
	public List<NoticeDto> qnalist(Map<String, Object> map) throws SQLException {
		return sqlSession.getMapper(NoticeDao.class).qnalist(map);
	}

	@Override
	public int totalCount() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.getMapper(NoticeDao.class).totalCount();
	}

	
	
	
}
