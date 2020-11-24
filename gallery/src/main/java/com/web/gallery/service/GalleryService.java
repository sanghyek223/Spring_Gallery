package com.web.gallery.service;

import java.util.List;

import com.web.gallery.vo.GalleryVO;

public interface GalleryService {

	// Gallery list
	public List<GalleryVO> list(int displayPost, int postNum) throws Exception;
	
	// Gallery view
	public GalleryVO view(int no) throws Exception;
	
	// Gallery update
	public void update(GalleryVO vo) throws Exception;

	// Gallery insert
	public void insert(GalleryVO vo) throws Exception;

	// Gallery delete
	public void delete(int no) throws Exception;

	// Main Gallery list
	public List<GalleryVO> Randomlist() throws Exception;
	
	// 게시글 총 개수
	public int GalleryCount() throws Exception;
	
	// 주제별 게시글 개수
	public int GalleryTitleCount(String title) throws Exception;
	
	// Gallery Title list
	public List<GalleryVO> Titlelist(int displayPost, int postNum, String searchType) throws Exception;
	
	// 검색 조건별 게시글 개수 
	public int searchCount(String searchType) throws Exception;

}
