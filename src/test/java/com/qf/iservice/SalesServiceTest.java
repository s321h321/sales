package com.qf.iservice;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.druid.support.json.JSONUtils;
import com.qf.service.ISalesService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:spring.xml","classpath:spring-mybatis.xml"})
public class SalesServiceTest {

	@Resource
	private ISalesService saleService;
	@Test
	public void login(){
		List<HashMap<String,String>>salesMap=saleService.getAllSaleInfos(0);
		
		System.out.println(JSONUtils.parse(JSONUtils.toJSONString(salesMap)));
//		System.out.println(JSONUtils.toJSONString(salesMap));
//		int month = Calendar.getInstance().get(Calendar.MONTH)+1;
//		System.out.println(month);
	}
}
