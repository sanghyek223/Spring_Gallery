package com.web.gallery.service;

import java.util.List;

import com.web.gallery.vo.FAQVO;

public interface FAQService {
	
	//FAQ view
	 public List<FAQVO> list() throws Exception;
	 
	//FAQ 내용
	 public FAQVO FAQview(int no) throws Exception;
	 
	//FAQ 작성
	 public void insert(FAQVO vo) throws Exception;
	 
	//FAQ 수정
	 public void update(FAQVO vo) throws Exception;
	 
    //FAQ 삭제
	 public void delete(int no) throws Exception;

}
