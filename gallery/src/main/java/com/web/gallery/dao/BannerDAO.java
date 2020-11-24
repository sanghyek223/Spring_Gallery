package com.web.gallery.dao;

import java.util.List;

import com.web.gallery.vo.BannerVO;

public interface BannerDAO {
	
	// Banner list
	public List<BannerVO> list() throws Exception;
	
	//page_banner
	public BannerVO page_banner(String name) throws Exception;
	
	// Banner modify
	public void update(BannerVO vo) throws Exception;

}
