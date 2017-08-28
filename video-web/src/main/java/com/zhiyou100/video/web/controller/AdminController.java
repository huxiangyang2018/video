package com.zhiyou100.video.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zhiyou100.video.dao.model.Admin;
import com.zhiyou100.video.service.AdminService;

@Controller
//@RequestMapping("")
public class AdminController {
	
	@Autowired
	AdminService as;
	@RequestMapping("/admin/login.action")
	public String login(Admin a,HttpServletRequest req){
		Admin admin = as.adminLogin(a);
		if(admin!=null){
			req.getSession().setAttribute("admin", admin);
			return "redirect:/video/video-list.action";
		}else{
			req.setAttribute("error", "用户名和密码不匹配");
			return "forward:/index.jsp";
		}
	}
	
	@RequestMapping("/admin/loginOut.action")
	public String loginOut(HttpServletRequest req){
		req.getSession().removeAttribute("admin");
		return "forward:/index.jsp";
	}
}
