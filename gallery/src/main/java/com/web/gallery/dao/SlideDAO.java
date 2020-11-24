package com.web.gallery.dao;

import java.util.List;

import com.web.gallery.vo.SlideVO;

public interface SlideDAO {

	//slide list
	public List<SlideVO> list() throws Exception;
	
	// Slide insert
	public void insert(SlideVO vo) throws Exception;
	
	// Slide update
	public void update(SlideVO vo) throws Exception;
	
	// Slide delete
	public void delete(int no) throws Exception;
	
}
