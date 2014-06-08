package com.qf.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.mapper.IUserMapper;
import com.qf.service.IUserService;
@Service
public class UserService implements IUserService {
	@Resource
	private IUserMapper userDao;
	@Override
	public boolean IsLogin(String username, String password) {
		return userDao.isLogin(username, password)>0;
	}

}
