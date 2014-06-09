package com.qf.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.druid.support.json.JSONUtils;
import com.qf.service.ISalesService;

@Controller
public class SalesController {

	public static Logger logger = Logger.getLogger(SalesController.class);
	@Resource
	private ISalesService salesService;

	@RequestMapping("/sales")
	public String getSaleInfos(ModelMap map) {
		List<HashMap<String, String>> saleslist = salesService.getSaleInfos();
		map.put("salesInfo", JSONUtils.toJSONString(saleslist));
		return "/pages/salesInfo";
	}

	@RequestMapping("/sales/add")
	public String addsale(int uid, int money, int ouid, Date saletime,
			ModelMap map) {
		try {
			salesService.addsale(uid, money, ouid, saletime);
			map.put("info", "业绩添加成功！！！");
		} catch (Exception e) {

			map.put("info", "业绩添加失败！！！");
			logger.error(e);
		}
		return "/pages/salesInfo";
	}

	@RequestMapping("/sales/info")
	public String getAllSaleInfos(Integer month, ModelMap map) {
		month = null == month ? 0 : month;
		List<HashMap<String, String>> saleslist = salesService
				.getAllSaleInfos(month);
		map.put("salesdata", JSONUtils.toJSONString(saleslist));
		return "/pages/sales/sales";
	}

}
