package com.qf.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.qf.service.ISalesService;
import com.qf.service.IUserService;

@Controller
public class SalesController {

	public static Logger logger = Logger.getLogger(SalesController.class);
	@Resource
	private ISalesService salesService;
	@Resource
	private IUserService userS;
	@RequestMapping("/sales")
	public String getSaleInfos(ModelMap map) {
		List<HashMap<String, String>> saleslist = salesService.getSaleInfos();
		List<HashMap<String,String>> idandnames=userS.getUserIdAndNames(0);
		map.put("salesInfo", JSONUtils.toJSONString(saleslist));
		map.put("ids", JSONUtils.parse(JSONUtils.toJSONString(idandnames)));
		return "/pages/salesInfo";
	}
	@RequestMapping("/getsales")
	public @ResponseBody String getSaleInfos() {
		List<HashMap<String, String>> saleslist = salesService.getSaleInfos();
		return JSONUtils.toJSONString(saleslist);
	}

	@RequestMapping("/sales/add")
	public String addsale(Integer uid, Integer money, String saletime) {
		try {
			salesService.addsale(uid, money, -1, saletime);
		} catch (Exception e) {
			logger.error(e);
		}
		return "redirect:/demos.html";
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
