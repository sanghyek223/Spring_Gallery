package com.web.gallery.service;

import java.util.List;

import com.web.gallery.vo.SocialVO;

public interface SocialService {
	
	
	 //social list
	 public List<SocialVO> list() throws Exception;
	 
	 //social 내용
	 public SocialVO socialView(String social_name) throws Exception;
	 
	 //social link modify
	 public void update(SocialVO vo) throws Exception;
	 
}
