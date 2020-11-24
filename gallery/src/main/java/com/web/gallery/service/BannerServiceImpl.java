package com.web.gallery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.gallery.dao.BannerDAO;
import com.web.gallery.vo.BannerVO;

@Service
public class BannerServiceImpl implements BannerService{
	
	@Inject
	private BannerDAO dao;

	@Override
	public List<BannerVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	@Override
	public void update(BannerVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public BannerVO page_banner(String name) throws Exception {
		// TODO Auto-generated method stub
		return dao.page_banner(name);
	}


}
