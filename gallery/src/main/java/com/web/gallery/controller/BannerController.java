package com.web.gallery.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.gallery.service.BannerService;
import com.web.gallery.vo.BannerVO;

@Controller
public class BannerController {

	@Inject
	private BannerService service;

	//social 수정페이지 내용 불러오기
	@RequestMapping("adm/banner_modify_popup")
	public String modifypopup(Model model, @RequestParam("b_name") String social_name) throws Exception {
		//model.addAttribute("socialView", service.socialView(social_name));
		return "adm/slide/B_modify_popup";
	}
	
	
	// banner 수정
	@ResponseBody
	@PostMapping("/adm/banner_modify")
	private String ModifyBanner(@RequestParam(value = "file", required = false) MultipartFile file, BannerVO vo,HttpServletRequest req) throws Exception {
  
	    if(file.getOriginalFilename() != "") {
		    // 파일 이름 변경
		    UUID uuid = UUID.randomUUID();		
		    String saveName = uuid + "_" + file.getOriginalFilename();	  
		    
		    String root_path = req.getSession().getServletContext().getRealPath("");  
		    String attach_path = "/resources/upload/banner/";
		    String PATH = root_path + attach_path; //서버내 상대경로
		    
	        File dir = new File(PATH); //경로가 없으면 새로생성
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }

            String savePath = PATH + saveName; // 저장할 폴더 이름, 저장할 파일 이름		    
		    vo.setBanner_img(saveName);// 파일이 담기면 Profile_img 정보 변경
		    vo.setBanner_path(attach_path);// 상대경로 DB 저장
		    file.transferTo(new File(savePath)); // 업로드
		    
	     }

	    service.update(vo);
	    
	    return "suc";
	}
}
