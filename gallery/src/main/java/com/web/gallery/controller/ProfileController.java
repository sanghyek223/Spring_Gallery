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

import com.web.gallery.service.ProfileService;
import com.web.gallery.vo.ProfileVO;

@Controller
public class ProfileController {

	@Inject
	private ProfileService service;

	// 프로필 수정 팝업
	@RequestMapping("/adm/profile_modify_popup")
	public String modifypopup(Model model) throws Exception {
		ProfileVO vo;
		vo = service.view();
		model.addAttribute("profile", vo);
		return "adm/profile/modify_popup";
	}
	
	// 프로필 이미지 수정 팝업
	@RequestMapping("/adm/profile_ImgModify_popup")
	public String ImgModifypopup() {
		return "adm/profile/ImgModify_popup";
	}
	
	// 프로필 수정
	@ResponseBody
	@PostMapping("/adm/profile_modify")
	private String ProfileModify(ProfileVO vo) throws Exception {

	    service.update(vo);
	    
	    return "suc";
	}
	
	// 프로필 이미지 수정
	@ResponseBody
	@PostMapping("/adm/profile_modify_IMG")
	private String ProfileIMG(@RequestParam(value = "file", required = false) MultipartFile file,ProfileVO vo,HttpServletRequest req) throws Exception {
  
	    if(file.getOriginalFilename() != "") {
		    // 파일 이름 변경
		    UUID uuid = UUID.randomUUID();		
		    String saveName = uuid + "_" + file.getOriginalFilename();	 
		    
		    String root_path = req.getSession().getServletContext().getRealPath("");  
		    String attach_path = "/resources/upload/profile/";
		    String PATH = root_path + attach_path; //서버내 상대경로
		    
	        File dir = new File(PATH); //경로가 없으면 새로생성
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }	       

            String savePath = PATH + saveName; // 저장할 폴더 이름, 저장할 파일 이름
		    vo.setProfile_img(saveName);// 파일이 담기면 Profile_img 정보 변경
		    vo.setProfile_path(attach_path);// 상대경로 DB 저장

		    file.transferTo(new File(savePath)); // 업로드
			    
	     }

	    System.out.println(vo.getProfile_img());
	    service.updateIMG(vo);
	    
	    return "suc";
	}

}
