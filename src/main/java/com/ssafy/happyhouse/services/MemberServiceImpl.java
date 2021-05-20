package com.ssafy.happyhouse.services;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.mapper.MemberDao;
import com.ssafy.happyhouse.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void registerMember(MemberDto memberDto) throws Exception {
		sqlSession.getMapper(MemberDao.class).registerMember(memberDto);
	}

	@Override
	public MemberDto login(Map<String, String> map) {
		return sqlSession.getMapper(MemberDao.class).login(map);
	}

	@Override
	public List<MemberDto> memberList() throws SQLException {
		return sqlSession.getMapper(MemberDao.class).memberList();
	}

	@Override
	public MemberDto getMember(String userId) throws Exception {
		return sqlSession.getMapper(MemberDao.class).getMember(userId);
	}

	@Override
	public void modifyMember(MemberDto memberDto) throws SQLException {
		sqlSession.getMapper(MemberDao.class).modifyMember(memberDto);
	}

	@Override
	public void deleteMember(String userId) throws SQLException {
		sqlSession.getMapper(MemberDao.class).deleteMember(userId);
	}
	
}
