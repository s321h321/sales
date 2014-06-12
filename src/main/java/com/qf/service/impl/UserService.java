package com.qf.service.impl;


import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qf.mapper.IUserMapper;

import com.qf.service.IUserService;
@Transactional
@Service
public class UserService implements IUserService {

	@Override
	public int getUserId(String username) {
		// TODO Auto-generated method stub
		return userDao.getUserId(username);
	}

	
	@Override
	public boolean adduser(String name, String username, String password) {
		userDao.adduser(name, username, password);
		return true;
	}

	@Override
	public List<HashMap<String, String>> getUserIdAndNames(Integer position) {
		return userDao.getUserIdAndNames(position);
	}

	@Resource
	private IUserMapper userDao;

	@Override
	public boolean IsLogin(String username, String password) {
		return userDao.isLogin(username, password) > 0;
	}

}
