package com.jeizas.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jeizas.entity.ThreeMan;
import com.jeizas.service.ThreeManService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:conf/applicationContext.xml")
public class TestThreeMan extends AbstractJUnit4SpringContextTests{
	
	@Resource
	private ThreeManService threeManService;
	
	@Test
	public void getAll(){
		List<ThreeMan> list = threeManService.getThreeManList();
		for(ThreeMan t:list){
			System.out.println(t);
		}
	}
}
