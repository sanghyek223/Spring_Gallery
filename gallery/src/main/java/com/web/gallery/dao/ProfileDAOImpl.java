package com.web.gallery.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.gallery.vo.ProfileVO;

@Repository
public class ProfileDAOImpl implements ProfileDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.web.mappers.profile";

	// profile view
	@Override
	public ProfileVO view() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".profile");
	}

	// profile update
	@Override
	public void update(ProfileVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".update", vo);

	}

	@Override
	public void updateIMG(ProfileVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".updateIMG", vo);
	}

}
