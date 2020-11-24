package com.web.gallery.service;

import java.util.List;

import com.web.gallery.vo.SlideVO;

public interface SlideService {

	
	//Slide 등록
	 public List<SlideVO> list() throws Exception;
	 
	//Slide 등록
	 public void insert(SlideVO vo) throws Exception;
	 
	//Slide 수정
	 public void update(SlideVO vo) throws Exception;
	 
	//Slide 삭제
	 public void delete(int no) throws Exception;
	 
}
