package com.web.gallery.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.gallery.dao.GalleryDAO;
import com.web.gallery.vo.GalleryVO;

@Service
public class GalleryServiceImpl implements GalleryService{

	@Inject
	private GalleryDAO dao;
	
	@Override
	public List<GalleryVO> list(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(displayPost, postNum);
	}
	
	@Override
	public GalleryVO view(int no) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(no);
	}
	
	@Override
	public List<GalleryVO> Randomlist() throws Exception {
		// TODO Auto-generated method stub
		return dao.Randomlist();
	}
	
	@Override
	public void update(GalleryVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}
	
	@Override
	public void insert(GalleryVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(no);
	}

	@Override
	public int GalleryCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.GalleryCount();
	}

	@Override
	public int GalleryTitleCount(String title) throws Exception {
		// TODO Auto-generated method stub
		return dao.GalleryTitleCount(title);
	}

	@Override
	public List<GalleryVO> Titlelist(int displayPost, int postNum, String searchType) throws Exception {
		// TODO Auto-generated method stub
		return dao.Titlelist(displayPost, postNum,searchType);
	}

	@Override
	public int searchCount(String searchType) throws Exception {
		// TODO Auto-generated method stub
		return dao.searchCount(searchType);
	}


}
