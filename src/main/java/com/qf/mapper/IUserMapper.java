package com.qf.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IUserMapper {

	/**
	 * 验证用户是否可以登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public int isLogin(@Param("uname") String username,
			@Param("password") String password);

	/**
	 * 根据username获取id
	 */
	public int getUserId(@Param("username") String username);

	/**
	 * 获取用户ID和name的列表
	 * 
	 * @param position
	 *            职位
	 * @return
	 */
	public List<HashMap<String, String>> getUserIdAndNames(
			@Param("position") Integer position);

	/**
	 * 添加用户信息
	 * 
	 * @param name
	 *            姓名
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 */
	public void adduser(@Param("name") String name,
			@Param("username") String username,
			@Param("password") String password);

	/**
	 * 获取所有用户的信息
	 * 
	 * @return
	 */
	public List<HashMap<String, String>> getAllusers();
}
