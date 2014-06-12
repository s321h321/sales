package com.qf.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qf.mapper.IUserMapper;
import com.qf.service.ISalesService;
import com.qf.service.IUserService;
@Transactional
@Service
public class UserService implements IUserService {
	private ISalesService saleserv;

	@Override
	public int getUserId(String username) {
		// TODO Auto-generated method stub
		return userDao.getUserId(username);
	}

	
	@Override
	public boolean adduser(String name, String username, String password) {
//		try {
			userDao.adduser(name, username, password);
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			saleserv.addsale(getUserId(username), 0, -1,
					format.format(new Date()));
			return true;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false;
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
