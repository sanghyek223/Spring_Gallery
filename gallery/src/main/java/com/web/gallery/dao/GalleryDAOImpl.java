package com.web.gallery.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.gallery.vo.GalleryVO;

@Repository
public class GalleryDAOImpl implements GalleryDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.web.mappers.gallery";

	@Override
	public List<GalleryVO> list(int displayPost, int postNum) throws Exception {
		// TODO Auto-generated method stub
		HashMap data = new HashMap();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		return sql.selectList(namespace + ".galleryList", data);
	}

	@Override
	public List<GalleryVO> Randomlist() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".galleryRandomList");
	}

	@Override
	public GalleryVO view(int no) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".galleryView", no);
	}

	@Override
	public void update(GalleryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace + ".update", vo);
	}

	@Override
	public void insert(GalleryVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insert", vo);
	}

	@Override
	public void delete(int no) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace + ".delete", no);
	}

	@Override
	public int GalleryCount() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".gallerycount");
	}

	@Override
	public int GalleryTitleCount(String title) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".gallerTitleycount", title);
	}

	@Override
	public List<GalleryVO> Titlelist(int displayPost, int postNum, String searchType) throws Exception {
		// TODO Auto-generated method stub
		HashMap data = new HashMap();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		return sql.selectList(namespace + ".galleryList", data);
	}

	@Override
	public int searchCount(String searchType) throws Exception {
		// TODO Auto-generated method stub
		 HashMap data = new HashMap();
		 
		 data.put("searchType", searchType);
		return sql.selectOne(namespace + ".gallerySearchcount", data);
	}

}
