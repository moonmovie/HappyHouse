package com.ssafy.happyhouse.services;

import java.util.HashMap;

public interface KakaoService {
	public String getAccessToken(String authorize_code);
	public HashMap<String, Object> getUserInfo (String access_Token);
	public void kakaoLogout(String access_Token);
}
