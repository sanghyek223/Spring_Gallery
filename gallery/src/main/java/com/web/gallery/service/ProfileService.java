package com.web.gallery.service;

import com.web.gallery.vo.ProfileVO;

public interface ProfileService {
	

	//profile view
	 public ProfileVO  view() throws Exception;
	 
	//profile 수정
	 public void update(ProfileVO vo) throws Exception;
	 
    //profile img 수정
	 public void updateIMG(ProfileVO vo) throws Exception;

}
