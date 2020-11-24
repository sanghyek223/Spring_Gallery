package com.web.gallery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.gallery.dao.LoginDAO;
import com.web.gallery.vo.AdminVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO dao;
	
	@Override
	public AdminVO logincheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.logincheck(id);
	}

	@Override
	public void signup(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.signup(vo);
	}

	@Override
	public AdminVO Adminlogincheck(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.Adminlogincheck(vo);
	}

}
