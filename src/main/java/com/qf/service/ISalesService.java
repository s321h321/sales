package com.qf.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface ISalesService {
	/**
	 * 
	 * @param month 上月的月份
	 * @return 获取所有用户在5月份和6月份的销售额
	 */
	public List<HashMap<String,String>> getSaleInfos();
	/**
	 * 添加销售业绩
	 * @param uid 用户id
	 * @param money 金额
	 * @param month 月份
	 * @param operationuid 操作人
	 */
	public void addsale(int uid,int money,int operationuid,Date saletime);
	
	/**
	 * 
	 * @param month 上月的月份,查全部month=null
	 * @return 获取所有用户当前月份的销售额的所有信息
	 */
	public List<HashMap<String,String>> getAllSaleInfos(@Param("month")Integer month);
}
