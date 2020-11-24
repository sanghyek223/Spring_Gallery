package com.web.gallery.controller;

import java.io.File;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.gallery.service.SlideService;
import com.web.gallery.vo.SlideVO;

@Controller
public class SlideController {
	
	@Inject
	private SlideService service;	
	
	// slide insert popup
	@RequestMapping("/adm/slide_insert_popup")
	public String insertpopup() {
		return "adm/slide/S_insert_popup";
	}
	
	// slide insert
	@ResponseBody
	@PostMapping("/adm/slide_insert")
	private String InsertSlide(@RequestParam(value = "file", required = false) MultipartFile file, SlideVO vo,HttpServletRequest req) throws Exception {
		
  
	    if(file.getOriginalFilename() != "") {
		    // 파일 이름 변경
		    UUID uuid = UUID.randomUUID();		
		    String saveName = uuid + "_" + file.getOriginalFilename();	  
		    
		    String root_path = req.getSession().getServletContext().getRealPath("");  
		    String attach_path = "/resources/upload/slide/";
		    String PATH = root_path + attach_path; //서버내 상대경로
		    
	        File dir = new File(PATH); //경로가 없으면 새로생성
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }
	        
            String savePath = PATH + saveName; // 저장할 폴더 이름, 저장할 파일 이름 
		    
		    vo.setSlide_img(saveName);// 파일이 담기면 Profile_img 정보 변경
		    vo.setSlide_path(attach_path);// 상대경로 DB 저장
		    file.transferTo(new File(savePath)); // 업로드
		    
	     }

	    service.insert(vo);
	    
	    return "suc";
	}
	
	// slide modify popup
	@RequestMapping("/adm/slide_modify_popup")
	public String modifypopup() {
		return "adm/slide/S_modify_popup";
	}
	
	// slide modify
	@ResponseBody
	@PostMapping("/adm/slide_modify")
	private String ModifySlide(@RequestParam(value = "file", required = false) MultipartFile file, SlideVO vo,HttpServletRequest req) throws Exception {
		
  
	    if(file.getOriginalFilename() != "") {
		    // 파일 이름 변경
		    UUID uuid = UUID.randomUUID();		
		    String saveName = uuid + "_" + file.getOriginalFilename();	  
		    
		    String root_path = req.getSession().getServletContext().getRealPath("");  
		    String attach_path = "/resources/upload/slide/";
		    String PATH = root_path + attach_path; //서버내 상대경로
		    
	        File dir = new File(PATH); //경로가 없으면 새로생성
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }
	        
            String savePath = PATH + saveName; // 저장할 폴더 이름, 저장할 파일 이름 
		    
		    vo.setSlide_img(saveName);// 파일이 담기면 Profile_img 정보 변경
		    vo.setSlide_path(attach_path);// 상대경로 DB 저장
		    file.transferTo(new File(savePath)); // 업로드		    
	     }

	    service.update(vo);
	    
	    return "suc";
	}
	
	//slide delete
	@ResponseBody
	@GetMapping("/adm/slide_delete")
	public String faqDelete(@RequestParam("no")int no) throws Exception {
		service.delete(no);
		return "suc";
	}

}


