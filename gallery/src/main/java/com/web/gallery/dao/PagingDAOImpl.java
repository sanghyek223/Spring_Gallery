package com.web.gallery.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PagingDAOImpl implements PagingDAO {

	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.web.mappers.gallery";	
	
	
	//게시물 총 개수
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".gallerycount");
	}
	
}
