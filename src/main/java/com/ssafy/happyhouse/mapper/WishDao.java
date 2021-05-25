package com.ssafy.happyhouse.mapper;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.WishDto;

public interface WishDao {
	public List<WishDto> wishList(String userId) throws SQLException;
	public void registWish(String userId, String AptName) throws SQLException;
	public void deleteWish(String userId, String AptName) throws SQLException;
	public int checkWish(String userId, String AptName) throws SQLException;
}
