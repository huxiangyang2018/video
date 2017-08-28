package com.zhiyou100.video.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zhiyou100.video.dao.model.Admin;

public class CustomInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		String pwd = req.getParameter("loginPwd");
		Admin a = (Admin) req.getSession().getAttribute("admin");
		if(pwd!=null){
			return true;
		}else if(a!=null){
			return true;
		}else{
			req.setAttribute("errorMessage", "请登录");
			req.getRequestDispatcher("/index.jsp").forward(req, res);
			return false;
		}
	}

}
