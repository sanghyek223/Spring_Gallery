package com.web.gallery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.gallery.dao.FAQDAO;
import com.web.gallery.vo.FAQVO;

@Service
public class FAQServiceImpl implements FAQService{

	@Inject
	private FAQDAO dao;
	
	@Override
	public List<FAQVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	@Override
	public FAQVO FAQview(int no) throws Exception {
		// TODO Auto-generated method stub
		return dao.FAQview(no);
	}


	@Override
	public void insert(FAQVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void update(FAQVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(no);
	}

}
