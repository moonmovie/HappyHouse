package com.ssafy.happyhouse.services;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;

public interface NoticeService {
	public List<NoticeDto> noticeList() throws SQLException;
	
	public boolean registNotice(NoticeDto notice) throws SQLException;
	
	public boolean modifyNotice(NoticeDto notice) throws SQLException;
	
	public boolean deleteNotice(int noticeno) throws SQLException;
	
	public NoticeDto search(int no) throws SQLException;
	
	public List<NoticeDto> qnalist(Map<String,Object> map) throws SQLException;
	
	public int totalCount() throws SQLException;
}
