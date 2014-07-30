package com.qf.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.qf.service.ISalesService;
import com.qf.service.IUserService;

@Controller
public class UserController {

	@Resource
	private IUserService uService;
	@Resource
	private ISalesService saleSver;

	/**
	 * 验证用户是否可以登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping("/login")
	public String isLogin(String username, String password, HttpSession session) {
		boolean islogin = uService.IsLogin(username, password);
		if (islogin) {
			session.setAttribute("user", username);
			if (username.equals("caiyanting")) {
				return "redirect:/demos.html";
			} else {
				return "redirect:/sales.html";
			}
		} else {
			//String uname=null==session.getAttribute("user")?"":session.getAttribute("user").toString();
			//if (uname.length()>4&&uname.equals("caiyanting")) {
				return "/pages/Login/login";
			//}else{
			//return "redirect:/sales.html";
			//}
		}
	}

	@RequestMapping("/demos")
	public String forwordDemo(HttpSession session) {
		String uname=null==session.getAttribute("user")?"":session.getAttribute("user").toString();
		if (uname.equals("caiyanting")) {
			return "demo";
		}else{
			return "/pages/Login/login";
		}
		
	}

	@RequestMapping("/adduser")
	public @ResponseBody
	String adduser(String name, String username, String password) {
		boolean b = uService.adduser(name, username, password);
		if (b) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			int uid = uService.getUserId(username);
			saleSver.addsale(uid, 0, -1, format.format(new Date()));
			return "添加成功！！！";
		}
		return "添加失败！！！";
	}

	@RequestMapping("/getIdAndNames")
	public @ResponseBody
	String getUserIdAndNames() {
		return JSONUtils.toJSONString(uService.getUserIdAndNames(1));
	}
	@RequestMapping("/getAllusers")
	public @ResponseBody String getAllUsers(){
		ArrayList<String> nameslist=new ArrayList<String>();
		nameslist.add("姓名");
		nameslist.add("职位");
		nameslist.add("入职日期");
		return JSONUtils.toJSONString(nameslist)+","+JSONUtils.toJSONString(uService.getAllusers());
	}
}
