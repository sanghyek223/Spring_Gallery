package com.web.gallery.dao;

import java.util.List;

import com.web.gallery.vo.FAQVO;

public interface FAQDAO {

	// FAQ view
	public List<FAQVO> list() throws Exception;

	// FAQ 내용
	public FAQVO FAQview(int no) throws Exception;
	
	// FAQ insert
	public void insert(FAQVO vo) throws Exception;

	// FAQ modify
	public void update(FAQVO vo) throws Exception;

	// FAQ delete
	public void delete(int no) throws Exception;
	
	
}
