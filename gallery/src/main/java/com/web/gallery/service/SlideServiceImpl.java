package com.web.gallery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.gallery.dao.SlideDAO;
import com.web.gallery.vo.SlideVO;

@Service
public class SlideServiceImpl implements SlideService{

	
	@Inject
	private SlideDAO dao;

	@Override
	public List<SlideVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	@Override
	public void insert(SlideVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);		
	}

	@Override
	public void update(SlideVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);		
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(no);
	}


}
