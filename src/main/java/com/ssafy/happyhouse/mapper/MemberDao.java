package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberDao {

//	회원가입
	public void registerMember(MemberDto memberDto) throws SQLException;
	
//	로그인
	public MemberDto login(Map<String, String> map);

//  회원 전체 목록 
	public List<MemberDto> memberList() throws SQLException;
	
//	회원정보 수정을 위한 회원의 모든 정보 얻기
	public MemberDto getMember(String userId) throws SQLException;
	
//	회원정보 수정
	public void modifyMember(MemberDto memberDto) throws SQLException;
	
//	회원탈퇴
	public void deleteMember(String userId) throws SQLException;
	
}
