package com.web.gallery.service;

import java.util.List;

import com.web.gallery.vo.BannerVO;

public interface BannerService {
	
	//Banner List
	public List<BannerVO> list() throws Exception;
	
	//page banner
	public BannerVO page_banner(String name) throws Exception;
	
	//Banner 수정
	 public void update(BannerVO vo) throws Exception;

}
