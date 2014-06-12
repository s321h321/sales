package com.qf.service;

import java.util.HashMap;
import java.util.List;
public interface IUserService {

	public boolean IsLogin(String username,String password);
	public List<HashMap<String,String>>getUserIdAndNames(Integer position);
	public boolean adduser(String name,String username,String password);
	public int getUserId(String username);
}
