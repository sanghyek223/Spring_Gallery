package com.web.gallery.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.gallery.vo.FAQVO;

@Repository
public class FAQDAOImpl implements FAQDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.web.mappers.FAQ";
	
	// FAQ view
	@Override
	public List<FAQVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".FAQ");
	}
	
	//FAQ 내용
	@Override
	public FAQVO FAQview(int no) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".FAQview", no);
	}
	
	// FAQ insert
	@Override
	public void insert(FAQVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insert", vo);
	}

	// FAQ update
	@Override
	public void update(FAQVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".update", vo);

	}
	
	// FAQ delete
	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete",no);
	}


}
