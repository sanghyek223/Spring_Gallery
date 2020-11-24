package com.web.gallery.service;

import com.web.gallery.vo.AdminVO;

public interface LoginService {

	//kakao Login
	public AdminVO logincheck(String id) throws Exception;
	
	public void signup(AdminVO vo) throws Exception;
	
	//AdminLogin
	public AdminVO Adminlogincheck(AdminVO vo) throws Exception;
}
