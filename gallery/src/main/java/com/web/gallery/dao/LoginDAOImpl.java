package com.web.gallery.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.gallery.vo.AdminVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.web.mappers.admin";
	
	//kakaoLogin
	@Override
	public AdminVO logincheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".logincheck", id);
	}
	
	//AdminUser
	@Override
	public AdminVO Adminlogincheck(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".AdminLoginCheck", vo);
	}
	
	@Override
	public void signup(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".signnup", vo);
	}
	
}
