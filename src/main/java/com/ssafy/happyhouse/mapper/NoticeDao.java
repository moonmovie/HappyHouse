package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;

public interface NoticeDao {
	
	public List<NoticeDto> noticeList() throws SQLException;
	
	public int registNotice(NoticeDto notice) throws SQLException;
	
	public int modifyNotice(NoticeDto notice) throws SQLException;
	
	public int deleteNotice(int noticeno) throws SQLException;
	
	public NoticeDto search(int no) throws SQLException;
	
	public List<NoticeDto> qnalist(Map<String,Object> map) throws SQLException;
	
	public int totalCount() throws SQLException;
}
