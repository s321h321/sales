package com.qf.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qf.service.ISalesService;
import com.qf.service.IUserService;

@Controller
public class UserController {

	@Resource
	private IUserService uService;
	@Resource
	private ISalesService sservice;

	/**
	 * 验证用户是否可以登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("/login")
	public String isLogin(String username, String password,HttpSession session) {
		boolean islogin = uService.IsLogin(username, password);
		if (islogin) {
			session.setAttribute("user", username);
			return "redirect:/sales.html";
		} else {
			return "/pages/Login/login";
		}
	}

	@RequestMapping("/adduser")
	public String adduser(String name, String username, String password) {
		boolean b = uService.adduser(name, username, password);
		if (b) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			sservice.addsale(uService.getUserId(username), 0, -1,
					format.format(new Date()));
		}
		return "redirect:/sales.html";
	}
	// @ResponseBody
	// @RequestMapping("/useridinfo")
	// public String getUserIdAndNames(Integer position){
	// position=null==position?0:position;
	// return JSONUtils.toJSONString(uService.getUserIdAndNames(position));
	// }
}
