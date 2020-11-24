package com.web.gallery.controller;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.gallery.service.SocialService;
import com.web.gallery.vo.SocialVO;

@Controller
public class SosicalController {
	
	@Inject
	private SocialService service;
	
	//social 수정페이지 내용 불러오기
	@RequestMapping("adm/Social_modify_popup")
	public String modifypopup(Model model, @RequestParam("social") String social_name) throws Exception {
		model.addAttribute("socialView", service.socialView(social_name));
		return "adm/social/modify_popup";
	}
	
	//social 수정후 업데이트
	@ResponseBody
	@PostMapping("/adm/social_modify")
	public String profileModify(SocialVO vo) throws Exception {
		service.update(vo);
		return "suc";
	}

}
