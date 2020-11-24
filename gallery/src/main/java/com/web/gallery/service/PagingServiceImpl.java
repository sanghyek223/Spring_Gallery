package com.web.gallery.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.gallery.dao.PagingDAO;

@Service
public class PagingServiceImpl implements PagingService {

	
	@Inject
	private PagingDAO dao;
	
	
	@Override
	public int count() throws Exception {
		// TODO Auto-generated method stub
		return dao.count();
	}

}
