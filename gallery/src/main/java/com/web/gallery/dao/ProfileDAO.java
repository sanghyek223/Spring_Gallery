package com.web.gallery.dao;

import com.web.gallery.vo.ProfileVO;

public interface ProfileDAO {

	//profile view
	public ProfileVO view() throws Exception;
	
	//profile modify
	 public void update(ProfileVO vo) throws Exception;
	 
    //profile IMG modify
	 public void updateIMG(ProfileVO vo) throws Exception;
}
