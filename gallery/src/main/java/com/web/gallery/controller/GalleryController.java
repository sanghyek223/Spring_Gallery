package com.web.gallery.controller;


import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.gallery.service.GalleryService;
import com.web.gallery.vo.GalleryVO;

@Controller
public class GalleryController {
	
	@Inject
	private GalleryService service;
	
	//Gallery insert
	@ResponseBody
	@PostMapping("/adm/gallery_upload")
    public String write(HttpServletRequest req, GalleryVO vo, MultipartHttpServletRequest file) throws Exception {
 
	    String root_path = req.getSession().getServletContext().getRealPath("");  
	    String attach_path = "/resources/upload/gallery/";
	    String PATH = root_path + attach_path; //서버내 상대경로
	    
        File dir = new File(PATH); //경로가 없으면 새로생성
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }

        vo.setGallery_path(attach_path);// 상대경로 DB 저장
 
        // 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = file.getFiles("file");
        //System.out.println(vo.getGallery_title());
        
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
            	
                // 본래 파일명
                //String originalfileName = mf.get(i).getOriginalFilename();
            	
                // 파일 이름 변경
                UUID uuid = UUID.randomUUID();		
                String saveName = uuid + "_" +  mf.get(i).getOriginalFilename();       
 
                String savePath = PATH + saveName; // 저장할 폴더 이름, 저장할 파일 이름                
                vo.setGallery_img(saveName);// 파일이 담기면 Gallery_img 정보 변경 
                //System.out.println(vo.getGallery_img());
                mf.get(i).transferTo(new File(savePath)); // 업로드

                service.insert(vo); //DB 저장
                
            }
        }
        
        return "suc";
    }
	
	//Gallery modify 
	@ResponseBody
	@PostMapping("/adm/gallery_modify")
	private String GalleryModify(@RequestParam(value = "file", required = false) MultipartFile file, GalleryVO vo,HttpServletRequest req) throws Exception {
  
	    if(file.getOriginalFilename() != "") {
		    // 파일 이름 변경
		    UUID uuid = UUID.randomUUID();		
		    String saveName = uuid + "_" + file.getOriginalFilename();	  
		    
		    String root_path = req.getSession().getServletContext().getRealPath("");  
		    String attach_path = "/resources/upload/gallery/";
		    String PATH = root_path + attach_path; //서버내 상대경로
		    
	        File dir = new File(PATH); //경로가 없으면 새로생성
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }

            String savePath = PATH + saveName; // 저장할 폴더 이름, 저장할 파일 이름		    
		    vo.setGallery_img(saveName);// 파일이 담기면 Profile_img 정보 변경
		    vo.setGallery_path(attach_path);// 상대경로 DB 저장
		    file.transferTo(new File(savePath)); // 업로드
		    
	     }
	    System.out.println(vo.getGallery_path());
	    System.out.println(vo.getGallery_img());
	    service.update(vo);
	    
	    return "suc";
	}
	
	//Gallery modify popup	
	@RequestMapping("/adm/g_modify_popup")
	public String GalleryModify_Popup(Model model, @RequestParam("no") int no) throws Exception {
		model.addAttribute("gallery",service.view(no));
		return "adm/gallery/modify_popup";
	}
    
    
	
	//Gallery delete
	@ResponseBody
	@GetMapping("/adm/gallery_delete")
	public String GalleryDelete(@RequestParam("no")int no) throws Exception {
		service.delete(no);
		return "suc";
	}
	
  
    
	
	
}
