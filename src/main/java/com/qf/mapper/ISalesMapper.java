package com.qf.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
public interface ISalesMapper {

	/**
	 * 
	 * @param month 上月的月份
	 * @return 获取所有用户当前月份的销售额
	 */
	public List<HashMap<String,String>> getSaleInfos(@Param("month")int month);
	/**
	 * 添加销售业绩
	 * @param uid 用户id
	 * @param money 金额
	 * @param month 月份
	 * @param operationuid 操作人
	 */
	public void addsale(@Param("uid")int uid,@Param("money")int money,
			@Param("m")int month,@Param("ouid")int operationuid,@Param("saletime")Date saletime);
	/**
	 * 
	 * @param month 上月的月份
	 * @return 获取所有用户当前月份的销售额的所有信息
	 */
	public List<HashMap<String,String>> getAllSaleInfos(@Param("month")int month);
	
}
