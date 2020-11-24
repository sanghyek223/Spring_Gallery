package com.web.gallery.dao;

import com.web.gallery.vo.AdminVO;

public interface LoginDAO {
	
	//kakao Login
	public AdminVO logincheck(String id) throws Exception;

	public void signup(AdminVO vo) throws Exception;

	//Admin Login
	public AdminVO Adminlogincheck(AdminVO vo) throws Exception;

}
