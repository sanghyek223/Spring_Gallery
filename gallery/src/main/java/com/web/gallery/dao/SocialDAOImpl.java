package com.web.gallery.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.gallery.vo.SocialVO;

@Repository
public class SocialDAOImpl implements SocialDAO{

	@Inject
	private SqlSession sql;

	private static String namespace = "com.web.mappers.social";
	

	//social list
	@Override
	public List<SocialVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".social");
	}
	
	//social 내용
	@Override
	public SocialVO socialView(String social_name) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".socialview", social_name);
	}
	
	//social update
	@Override
	public void update(SocialVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".update", vo);
	}


}
