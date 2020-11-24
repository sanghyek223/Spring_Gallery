package com.web.gallery.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.gallery.service.FAQService;
import com.web.gallery.vo.FAQVO;

@Controller
public class FAQController {

	@Inject
	private FAQService service;
	
	//FAQ insert popup
	@RequestMapping("/adm/faq_insert_popup")
	public String insertpopup() {
		return "adm/faq/insert_popup";
	}	
	
	//FAQ insert
	@ResponseBody
	@PostMapping("/adm/faq_insert")
	public String faqInsert(FAQVO vo) throws Exception {
		service.insert(vo);
		return "suc";
	}

	//FAQ modify popup
	@RequestMapping("/adm/faq_modify_popup")
	public String modifypopup(Model model, @RequestParam("no") int no) throws Exception {
		model.addAttribute("faqview", service.FAQview(no));
		return "adm/faq/modify_popup";
	}

	//FAQ modify
	@ResponseBody
	@PostMapping("/adm/faq_modify")
	public String faqModify(FAQVO vo) throws Exception {
		service.update(vo);
		return "suc";
	}
	
	//FAQ delete
	@ResponseBody
	@GetMapping("/adm/faq_delete")
	public String faqDelete(@RequestParam("no")int no) throws Exception {
		service.delete(no);
		return "suc";
	}
	
}
