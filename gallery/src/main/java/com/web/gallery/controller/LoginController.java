package com.web.gallery.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.gallery.service.LoginService;
import com.web.gallery.vo.AdminVO;

@Controller
public class LoginController {

	@Inject
	private LoginService service;

	@Inject
	BCryptPasswordEncoder pwdEncoder;

	// Login Check
	@ResponseBody
	@RequestMapping("/loginCheck")
	public String Login(HttpServletRequest req, HttpSession session) throws Exception {

		if (service.logincheck(req.getParameter("admin_id")) != null) {
			session.setAttribute("id", req.getParameter("admin_id"));
			return "suc";
		} else {
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping("/IDCheck")
	public String IDcheck(HttpServletRequest req) throws Exception {

		if (service.logincheck(req.getParameter("admin_id")) != null) {
			return "suc";
		} else {
			return "fail";
		}
	}

	// signup
	@ResponseBody
	@RequestMapping("/SignUp")
	public String Signup(HttpServletRequest req) throws Exception {

		AdminVO vo = new AdminVO();
		vo.setAdmin_id(req.getParameter("admin_id"));
		service.signup(vo);
		return "suc";
	}

	@ResponseBody
	@RequestMapping("/logout")
	public String Login(HttpSession session) throws Exception {

		// session.removeAttribute("id"); //해당 세션만 삭제
		session.invalidate(); // 세션 전체 삭제
		return "suc";
	}

	// Admin User Login Check
	@ResponseBody
	@RequestMapping("/adm/Usr_LoginCheck")
	public String User_Login(HttpSession session, AdminVO vo) throws Exception {

		String pw = vo.getAdmin_pw(); // 입력된 비밀번호
		//System.out.println("입력PW => "+pw);
		//System.out.println("입력 PW 암호화 => "+pwdEncoder.encode(pw));
		vo = service.Adminlogincheck(vo);
		if (vo != null) { // ID정보가 있을경우
			// System.out.println("받아온 pw => "+vo.getAdmin_pw());
			if (!pwdEncoder.matches(pw, vo.getAdmin_pw())) { // 암호화된 유저의 pw 비교
				return "pwFail";
			} else {
				session.setAttribute("id", vo.getAdmin_id());
				return "suc";
			}
		} else {
			return "fail";
		}
	}

}
