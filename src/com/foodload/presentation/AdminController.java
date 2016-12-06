package com.foodload.presentation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.foodload.domain.Admin;
import com.foodload.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String loginForm() throws Exception {
		return "/admin/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(Admin admin, HttpSession session, HttpServletRequest request) throws Exception {
		RedirectView redirectView = new RedirectView("/restaurant/list");
		redirectView.setExposeModelAttributes(false);

		admin = adminService.login(admin);
		if (admin != null) {
			session.setAttribute("admin", admin);
		}
		return new ModelAndView(redirectView);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception {
		RedirectView redirectView = new RedirectView("/admin/loginform");
		redirectView.setExposeModelAttributes(false);

		session.removeAttribute("admin");

		return new ModelAndView(redirectView);
	}
}
