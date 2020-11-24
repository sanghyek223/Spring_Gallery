package com.web.gallery.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.gallery.service.BannerService;
import com.web.gallery.service.FAQService;
import com.web.gallery.service.GalleryService;
import com.web.gallery.service.PagingService;
import com.web.gallery.service.ProfileService;
import com.web.gallery.service.SlideService;
import com.web.gallery.service.SocialService;

@Controller
public class GalleryViewController {

	@Inject
	private ProfileService Profile;

	@Inject
	private SocialService Social;
	
	@Inject
	private SlideService Slide;
	
	@Inject
	private BannerService Banner;
	
	@Inject
	private GalleryService Gallery;
	
	@Inject
	private PagingService Paging;
	
	@Inject
	private FAQService FAQ;
	
	@RequestMapping("/")
	public String Main(Model model) throws Exception {
		model.addAttribute("slidelist", Slide.list());
		model.addAttribute("profile", Profile.view());
		model.addAttribute("galleryRandom", Gallery.Randomlist());
		model.addAttribute("social", Social.list());
		model.addAttribute("FAQlist", FAQ.list());
		return "main/main.tiles";
	}
	
	@RequestMapping("/profile")
	public String Profile(Model model) throws Exception {
		String name = "Profile";
		model.addAttribute("banner", Banner.page_banner(name));
		model.addAttribute("profile", Profile.view());
		model.addAttribute("social", Social.list());
		return "profile/main.tiles";
	}
	
	// 게시물 목록 + 페이징 추가
	@RequestMapping("/gallery")
	public String Gallery(Model model,@RequestParam(value="num",required=false,defaultValue="1" ) int num,@RequestParam(value="searchType",required = false, defaultValue = "" ) String searchType) throws Exception {

		model.addAttribute("banner", Banner.page_banner("Gallery"));
		model.addAttribute("galleryRandom", Gallery.Randomlist());
		
		Page page = new Page();
		page.setNum(num);
		page.setCount(Gallery.searchCount(searchType)); //검색조건에따른 게시글
		page.setSearchType(searchType);
		
		model.addAttribute("page", page);		
		// 현재 페이지
		model.addAttribute("select", num);		 
		model.addAttribute("gallery", Gallery.Titlelist(page.getDisplayPost(), page.postNum, searchType));   
		return "gallery/main.tiles";	
	
	}

	@RequestMapping("/faq")
	public String FAQ(Model model) throws Exception {
		String name = "FAQ";
		model.addAttribute("banner", Banner.page_banner(name));
		model.addAttribute("FAQlist", FAQ.list());
		return "faq/main.tiles";
	}
	
	@RequestMapping("/inquiry")
	public String inquiry(Model model) throws Exception {
		String name = "Inquiry";
		model.addAttribute("banner", Banner.page_banner(name));
		model.addAttribute("social", Social.list());
		return "inquiry/main.tiles";
	}
}
