package com.qf.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qf.service.IUserService;

@Controller
public class UserController {

	@Resource
	private IUserService uService;
	/**
	 * 验证用户是否可以登录
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("/login")
	public String isLogin(String username,String password){
		boolean islogin=uService.IsLogin(username, password);
		if(islogin){
			return "redirect:/sales.html";
		}else{
			return "/pages/Login/login";
		}
	}
}
