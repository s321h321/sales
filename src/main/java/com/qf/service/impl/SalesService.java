package com.qf.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qf.mapper.ISalesMapper;
import com.qf.service.ISalesService;
@Service
public class SalesService implements ISalesService{

	@Resource
	private ISalesMapper saleDao;
	int month = Calendar.getInstance().get(Calendar.MONTH)+1;
	/**
	 * 
	 * @param month 上月的月份
	 * @return 获取所有用户在5月份和6月份的销售额
	 */
	@Override
	public List<HashMap<String,String>> getSaleInfos() {
		return saleDao.getSaleInfos(month);
	}
	@Override
	public void addsale(int uid, int money,int operationuid,String saletime) {
		saleDao.addsale(uid, money, month, operationuid,saletime);
		
	}
	@Override
	public List<HashMap<String, String>> getAllSaleInfos(Integer month) {
		return saleDao.getAllSaleInfos(month);
	}


}
