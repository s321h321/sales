package com.qf.mapper;

import org.apache.ibatis.annotations.Param;

public interface IUserMapper {

	/**
	 * 验证用户是否可以登录
	 * @param username
	 * @param password
	 * @return
	 */
	public int isLogin(@Param("uname")String username,@Param("password")String password);
}
