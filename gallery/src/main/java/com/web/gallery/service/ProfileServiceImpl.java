package com.web.gallery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.gallery.dao.ProfileDAO;
import com.web.gallery.vo.ProfileVO;

@Service
public class ProfileServiceImpl implements ProfileService{

	
	@Inject
	private ProfileDAO dao;

	@Override
	public ProfileVO view() throws Exception {
		// TODO Auto-generated method stub
		return dao.view();
	}

	@Override
	public void update(ProfileVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	
	@Override
	public void updateIMG(ProfileVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateIMG(vo);		
	}


}
