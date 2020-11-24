package com.web.gallery.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.gallery.vo.SlideVO;

@Repository
public class SlideDAOImpl implements SlideDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.web.mappers.slide";
	
	//slide list
	@Override
	public List<SlideVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".slidelist");
	}
	
	//slide insert
	@Override
	public void insert(SlideVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insert", vo);		
	}

	//slide update
	@Override
	public void update(SlideVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", no);
		
	}


}
