package com.web.gallery.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.gallery.vo.BannerVO;

@Repository
public class BannerDAOImpl implements BannerDAO{

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.web.mappers.Banner";

	@Override
	public List<BannerVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".BannerList");
	}

	@Override
	public void update(BannerVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".update", vo);		
	}

	@Override
	public BannerVO page_banner(String name) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".page_banner", name);
	}

}
