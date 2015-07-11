package com.jeizas.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jeizas.dao.BaseDao;
import com.jeizas.entity.ThreeMan;
import com.jeizas.service.ThreeManService;

@Service("threeManService")
public class ThreeManServiceImpl implements ThreeManService {
	
	@Resource
	private BaseDao<ThreeMan> threeManDao;

	@Override
	public List<ThreeMan> getThreeManList() {
		// TODO Auto-generated method stub
		return threeManDao.find(" from ThreeMan t order by t.id ");
	}

	@Override
	public void updateThreeMan(ThreeMan threeMan) {
		// TODO Auto-generated method stub
		threeManDao.update(threeMan);
	}

}
