package com.web.gallery.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
public class AdminViewPageController {

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

	@RequestMapping("/adm")
	public String login(HttpSession sesion, Model model) throws Exception {
		String reload = null;
		if (sesion.getAttribute("id") != null) {
			String p = "인물";
			String s = "사물";
			String t = "풍경";
			model.addAttribute("All", Gallery.GalleryCount());
			model.addAttribute("P", Gallery.GalleryTitleCount(p));
			model.addAttribute("S", Gallery.GalleryTitleCount(s));
			model.addAttribute("T", Gallery.GalleryTitleCount(t));
			reload = "main/main.adm";
		} else {
			reload = "adm/login/main";
		}
		return reload;
	}

	@RequestMapping("/adm/main")
	public String main(Model model) throws Exception {

		String p = "인물";
		String s = "사물";
		String t = "풍경";
		model.addAttribute("All", Gallery.GalleryCount());
		model.addAttribute("P", Gallery.GalleryTitleCount(p));
		model.addAttribute("S", Gallery.GalleryTitleCount(s));
		model.addAttribute("T", Gallery.GalleryTitleCount(t));

		return "main/main.adm";
	}

	// Admin profile page
	@RequestMapping("/adm/profile")
	public String profile(Model model) throws Exception {
		model.addAttribute("profile", Profile.view());
		return "profile/main.adm";
	}

	// Admin Gallery page
	@RequestMapping("/adm/gallery")
	public String gallery(Model model, @RequestParam(value = "num", required = false, defaultValue = "1") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "") String searchType)
			throws Exception {

		model.addAttribute("All", Gallery.GalleryCount());
		model.addAttribute("P", Gallery.GalleryTitleCount("인물"));
		model.addAttribute("S", Gallery.GalleryTitleCount("사물"));
		model.addAttribute("T", Gallery.GalleryTitleCount("풍경"));

		Page page = new Page();
		page.setNum(num);
		page.setCount(Gallery.searchCount(searchType)); // 검색조건에따른 게시글
		page.setSearchType(searchType);

		model.addAttribute("page", page);
		// 현재 페이지
		model.addAttribute("select", num);
		model.addAttribute("gallery", Gallery.Titlelist(page.getDisplayPost(), page.postNum, searchType));

		return "gallery/main.adm";
	}

	// Admin FAQ page
	@RequestMapping("/adm/faq")
	public String faq(Model model) throws Exception {
		model.addAttribute("FAQlist", FAQ.list());
		return "faq/main.adm";
	}

	// Admin social page
	@RequestMapping("/adm/social")
	public String social(Model model) throws Exception {
		model.addAttribute("social", Social.list());
		return "social/main.adm";
	}

	// Admin slide/banner page
	@RequestMapping("/adm/slide")
	public String slide(Model model) throws Exception {
		model.addAttribute("slidelist", Slide.list());
		model.addAttribute("bannerlist", Banner.list());
		return "slide/main.adm";
	}

	@RequestMapping("/adm/setting")
	public String setting() {
		return "setting/main.adm";
	}

	@RequestMapping("/adm/user_login")
	public String AdminLogin() {
		return "adm/login/modify_popup";
	}

}
