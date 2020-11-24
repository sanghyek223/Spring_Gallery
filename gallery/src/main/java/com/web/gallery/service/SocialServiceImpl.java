package com.web.gallery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.gallery.dao.SocialDAO;
import com.web.gallery.vo.SocialVO;

@Service
public class SocialServiceImpl implements SocialService{

	@Inject
	private SocialDAO dao;
	
	//social update
	@Override
	public void update(SocialVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	//social 내용
	@Override
	public SocialVO socialView(String social_name) throws Exception {
		// TODO Auto-generated method stub
		return dao.socialView(social_name);
	}
	
	//social list
	@Override
	public List<SocialVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}


}
