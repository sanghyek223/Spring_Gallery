package com.web.gallery.dao;

import java.util.List;

import com.web.gallery.vo.SocialVO;

public interface SocialDAO {

	//Social list
	public List<SocialVO> list() throws Exception;
	
	//Social 상세
	public SocialVO socialView(String social_name) throws Exception;
	
	//Social modify
	 public void update(SocialVO vo) throws Exception;
}
